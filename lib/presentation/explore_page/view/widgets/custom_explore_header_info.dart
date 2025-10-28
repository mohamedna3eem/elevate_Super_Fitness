import 'package:elevate_super_fitness/core/constants/app_images.dart';
import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExploreHeaderInfo extends StatelessWidget {
  const CustomExploreHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Row(
      key: const Key(WidgetsKeys.kExploreScreenHeaderInfoKey),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          key: const Key(WidgetsKeys.kExploreScreenHeaderTextKey),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${local.hi} Ahmed ,",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
            Text(
              local.letsStartYourDay,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ClipRRect(
          key: const Key(WidgetsKeys.kExploreScreenHeaderImageKey),
          borderRadius: BorderRadiusGeometry.circular(18.sp),
          child: Image.asset(
            AppImages.authBg,
            width: 36.w,
            height: 36.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
