import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_cached_network_image.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_states.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomExploreHeaderInfo extends StatelessWidget {
  const CustomExploreHeaderInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return BlocBuilder<MainHomeViewModel, MainHomeStates>(
      builder: (context, state) {
        return Row(
          key: const Key(WidgetsKeys.kExploreScreenHeaderInfoKey),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              key: const Key(WidgetsKeys.kExploreScreenHeaderTextKey),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${local.hi} ${state.userInfo?.data?.firstName ?? ""} ,",
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
            Builder(
              builder: (context) {
                if (state.userInfo?.isLoading == true) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.15),
                    highlightColor: Colors.white.withOpacity(0.35),
                    direction: ShimmerDirection.ltr,
                    period: const Duration(milliseconds: 1200),
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    context.read<MainHomeViewModel>().doIntent(
                      OnBottomNavBarTappedEvent(index: 3),
                    );
                  },
                  child: ClipRRect(
                    key: const Key(WidgetsKeys.kExploreScreenHeaderImageKey),
                    borderRadius: BorderRadiusGeometry.circular(18.sp),
                    child: CustomCachedNetworkImage(
                      imageUrl: state.userInfo?.data?.photo ?? "",
                      width: 36.w,
                      height: 36.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
