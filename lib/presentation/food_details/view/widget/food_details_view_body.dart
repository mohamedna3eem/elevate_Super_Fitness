import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:elevate_super_fitness/presentation/food_details/view/widget/food_details_meal_info.dart';
import 'package:elevate_super_fitness/presentation/food_details/view_model/food_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../generated/l10n.dart';
import 'food_details_ingredients.dart';
import 'food_details_recommendations.dart';

class FoodDetailsViewBody extends StatefulWidget {
  const FoodDetailsViewBody({super.key});

  @override
  State<FoodDetailsViewBody> createState() => _FoodDetailsViewBodyState();
}

class _FoodDetailsViewBodyState extends State<FoodDetailsViewBody> {
  late final FoodDetailsViewModel _foodDetailsViewModel;

  @override
  void initState() {
    super.initState();
    _foodDetailsViewModel = context.read<FoodDetailsViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDetailsViewModel, FoodDetailsState>(
      bloc: _foodDetailsViewModel,
      builder: (context, state) {
        if (state.mealDetails != null) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodDetailsMealInfo(
                  imageUrl: state.mealDetails!.strMealThumb ?? "",
                  mealName: state.mealDetails!.strMeal ?? "",
                  mealInstructions: state.mealDetails!.strInstructions ?? "",
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    AppLocalizations.of(context).ingredients,
                    style: context.bodyLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                FoodDetailsIngredients(mealDetails: state.mealDetails!),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    AppLocalizations.of(context).recommendation,
                    style: context.bodyLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                state.isMealsLoading == false &&
                        state.mealsList != null &&
                        state.mealsList!.isNotEmpty
                    ? FoodDetailsRecommendations(
                        mealsList: state.mealsList ?? [],
                      )
                    : const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
