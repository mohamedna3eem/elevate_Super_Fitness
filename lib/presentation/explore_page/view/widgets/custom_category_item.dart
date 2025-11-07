import 'package:elevate_super_fitness/core/constants/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });
  final String title, imagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Image.asset(imagePath),
            SizedBox(height: 4.h),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.backGroundL[90],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
