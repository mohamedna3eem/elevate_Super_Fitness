import 'dart:ui';

import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/core/constants/app_images.dart';
import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/custom_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfCategory extends StatelessWidget {
  const ListOfCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final categories = [
      {'title': local.gym, 'image': AppImages.gymImage},
      {'title': local.fitness, 'image': AppImages.fitnessImage},
      {'title': local.yoga, 'image': AppImages.yogaImage},
      {'title': local.aerobics, 'image': AppImages.aerobicsImage},
      {'title': local.trainer, 'image': AppImages.trainerImage},
    ];
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 34.6, sigmaY: 34.6),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff242424).withOpacity(0.8),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            key: const Key(WidgetsKeys.kExploreScreenCategoryItemKey),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
            child: Row(
              children: List.generate(categories.length, (index) {
                final category = categories[index];
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomCategoryItem(
                          imagePath: category['image']!,
                          title: category['title']!,
                        ),
                      ),
                      if (index < categories.length - 1)
                        Container(
                          width: 1,
                          height: 80,
                          color: AppColors.backGroundL[20],
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
