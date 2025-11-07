import 'package:elevate_super_fitness/presentation/food/view/widget/food_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/di/di.dart';
import '../../view_model/food_events.dart';
import '../../view_model/food_view_model.dart';

class FoodScreen extends StatelessWidget {
  final int? categoryIndex;
  const FoodScreen({super.key, this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<FoodViewModel>()..doIntent(GetMealsCategoriesFoodEvent()),
        child: Stack(
          children: [
            Image.asset(
              AppImages.foodBg,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.backGroundL[110]!.withValues(alpha: 0.5),
                    offset: const Offset(0, 4),
                    blurRadius: 12.5,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            FoodViewBody(categoryIndex: categoryIndex),
          ],
        ),
      ),
    );
  }
}
