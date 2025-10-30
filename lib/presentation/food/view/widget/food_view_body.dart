import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:elevate_super_fitness/presentation/food/view/widget/food_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../view_model/food_events.dart';
import '../../view_model/food_view_model.dart';
import 'food_tab_bar.dart';

class FoodViewBody extends StatefulWidget {
  const FoodViewBody({super.key});

  @override
  State<FoodViewBody> createState() => _FoodViewBodyState();
}

class _FoodViewBodyState extends State<FoodViewBody>
    with TickerProviderStateMixin {
  late final FoodViewModel _foodViewModel;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _foodViewModel = context.read<FoodViewModel>();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24.w,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainColorL,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context).foodRecommendation,
                style: context.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<FoodViewModel, FoodState>(
            bloc: _foodViewModel,
            builder: (context, state) {
              if (state.mealsCategoriesList != null &&
                  state.mealsCategoriesList!.isNotEmpty) {
                initTabBar(state.mealsCategoriesList!.length);
                return Column(
                  children: [
                    FoodTabBar(
                      mealsCategoriesList:
                          _foodViewModel.state.mealsCategoriesList!,
                      tabController: _tabController!,
                    ),
                    SizedBox(height: 24.h),
                    Expanded(
                      child: state.isMealsLoading
                          ? const Center(child: CircularProgressIndicator())
                          : TabBarView(
                              controller: _tabController,
                              children: state.mealsCategoriesList!.map((_) {
                                return FoodTabBarView(
                                  mealsList:
                                      _foodViewModel.state.mealsList ?? [],
                                );
                              }).toList(),
                            ),
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  void initTabBar(int length) {
    if (_tabController == null || _tabController!.length != length) {
      _tabController?.dispose();
      _tabController = TabController(length: length, vsync: this);

      _tabController!.addListener(() {
        if (_tabController!.indexIsChanging) return;
        context.read<FoodViewModel>().doIntent(
          ChangeTabAndGetMealsFoodEvent(_tabController!.index),
        );
      });
    }
  }
}
