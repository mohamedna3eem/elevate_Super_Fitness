import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/core/model/exercise.dart';
import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../view_model/workout_event.dart';
import '../../view_model/workout_states.dart';
import '../../view_model/workout_view_model.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/exersize_card.dart';

class WorkoutsPage extends StatefulWidget {
  final MainHomeViewModel mainHomeViewModel;

  const WorkoutsPage({super.key, required this.mainHomeViewModel});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      key: const ValueKey('workouts page'),
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          widget.mainHomeViewModel.doIntent(
            OnScrollUpdateEvent(
              notification.metrics.pixels,
              notification.scrollDelta ?? 0,
            ),
          );
        }
        return true;
      },

      child: BlocProvider(
        create: (_) => getIt<WorkoutViewModel>()..doIntent(WorkoutEvent()),
        child: BlocBuilder<WorkoutViewModel, WorkoutStates>(
          builder: (context, state) {
            final musclesGroup =
                state.workoutResponseEntity?.musclesGroup ?? [];

            if (_tabController == null && musclesGroup.isNotEmpty) {
              _tabController = TabController(
                length: musclesGroup.length,
                vsync: this,
              );

              _tabController!.addListener(() {
                if (_tabController!.indexIsChanging) return;
                final muscleId = musclesGroup[_tabController!.index].id;
                context.read<WorkoutViewModel>().doIntent(
                  MusclesEvent(id: muscleId ?? ""),
                );
              });

              final firstId = musclesGroup.first.id;
              context.read<WorkoutViewModel>().doIntent(
                MusclesEvent(id: firstId ?? ""),
              );
            }

            if (state.status == WorkoutStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == WorkoutStatus.error) {
              return const Center(
                child: Text(
                  "Error loading workouts",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            if (state.status == WorkoutStatus.success) {
              if (musclesGroup.isEmpty) {
                return const Center(
                  child: Text(
                    " No muscles data available ",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return Column(
                children: [
                  SizedBox(height: 40.h),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).workouts,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  CustomTabBarPage(
                    tabController: _tabController!,
                    tabs: musclesGroup.map((e) => e.name ?? '').toList(),
                  ),

                  Expanded(
                    child: Builder(
                      builder: (BuildContext context) {
                        if (state.musclesStatus == MusclesStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state.musclesStatus == MusclesStatus.error) {
                          return const Center(
                            child: Text(
                              "Error loading workouts",
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        if (state.musclesStatus == MusclesStatus.success) {
                          return TabBarView(
                            controller: _tabController,
                            children: musclesGroup.map((group) {
                              final muscles =
                                  state.musclesByIdEntity?.muscles ?? [];

                              return Padding(
                                padding: EdgeInsets.all(12.w),
                                child: GridView.builder(
                                  itemCount: muscles.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12,
                                        childAspectRatio: 1,
                                      ),
                                  itemBuilder: (context, index) {
                                    final muscle = muscles[index];
                                    return ExerciseCard(
                                      imageUrl: muscle.image ?? "",
                                      title: muscle.name!,
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          RouteNames.exercise,
                                          arguments: ExerciseModel(
                                            exciseName: muscle.name ?? "",
                                            primeMoverMuscleId: muscle.id ?? "",
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: Text("No Data", style: TextStyle(color: Colors.white)),
            );
          },
        ),
      ),
    );
  }
}
