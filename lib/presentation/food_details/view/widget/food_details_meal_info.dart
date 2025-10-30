import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class FoodDetailsMealInfo extends StatelessWidget {
  final String imageUrl;
  final String mealName;
  final String mealInstructions;

  const FoodDetailsMealInfo({
    super.key,
    required this.imageUrl,
    required this.mealName,
    required this.mealInstructions,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            child: CustomCachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.25, 1],
                colors: [
                  AppColors.black.withValues(alpha: 0),
                  AppColors.backGroundL,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
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
                const Spacer(),
                Text(
                  mealName,
                  style: context.bodyLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  mealInstructions,
                  style: context.bodyMedium?.copyWith(color: AppColors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildNutritionFacts(context, "Energy", "100 K"),
                    buildNutritionFacts(context, "Protein", "15.6"),
                    buildNutritionFacts(context, "Carbs", "58 G"),
                    buildNutritionFacts(context, "Fat", "20 G"),
                  ],
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNutritionFacts(BuildContext context, String title, String value) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.white, width: .5.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: context.bodySmall?.copyWith(color: AppColors.white),
          ),
          Text(
            title,
            style: context.bodySmall?.copyWith(
              color: AppColors.mainColorL,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
