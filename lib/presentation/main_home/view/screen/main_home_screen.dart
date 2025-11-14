import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/presentation/main_home/view/widgets/main_home_view_body.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_states.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});

  final MainHomeViewModel mainHomeViewModel = getIt.get<MainHomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          mainHomeViewModel..doIntent(GetUserInfoMainHomeEvent()),
      child: BlocBuilder<MainHomeViewModel, MainHomeStates>(
        bloc: mainHomeViewModel,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backGroundL[10],
            body: MainHomeViewBody(
              mainHomeViewModel: mainHomeViewModel,
              state: state,
            ),
          );
        },
      ),
    );
  }
}
