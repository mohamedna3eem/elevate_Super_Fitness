import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExploreTabBarItem extends StatelessWidget {
  const CustomExploreTabBarItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      key: const Key(WidgetsKeys.kExploreScreenTabBarItemKey),
      decoration: BoxDecoration(
        color: isActive == true
            ? theme.colorScheme.primary
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Center(
          child: Text(
            "Full Body",
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
