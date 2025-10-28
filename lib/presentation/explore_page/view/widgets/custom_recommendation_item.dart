import 'dart:ui';

import 'package:elevate_super_fitness/core/constants/app_images.dart';
import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRecommendationItem extends StatelessWidget {
  const CustomRecommendationItem({
    super.key,
    this.width,
    this.height,
    this.border = true,
  });
  final int? width, height;
  final bool border;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      key: const Key(WidgetsKeys.kExploreScreenRecommendationItemKey),
      borderRadius: BorderRadius.circular(20.r),
      child: AspectRatio(
        aspectRatio: (width != null && height != null)
            ? width! / height!
            : 104 / 104,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.authBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: border == true
                    ? BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      )
                    : BorderRadius.circular(0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 34.6, sigmaY: 34.6),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0xFF242424).withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Center(
                        child: Text(
                          "Push-up",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
