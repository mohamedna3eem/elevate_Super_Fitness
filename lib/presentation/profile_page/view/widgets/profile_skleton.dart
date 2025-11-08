import 'package:elevate_super_fitness/presentation/profile_page/view/widgets/profile_setting.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../generated/l10n.dart';

class ProfileSkeleton extends StatelessWidget {
  final ProfileViewModel profileViewModel;
  const ProfileSkeleton(this.profileViewModel, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backGroundL,
      child: Skeletonizer(
        enableSwitchAnimation: true,
        containersColor: AppColors.backGroundL.withOpacity(0.8),
        effect: const ShimmerEffect(
          baseColor: Colors.white24,
          highlightColor: Colors.white38,
          duration: Duration(seconds: 2),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppIcons.arrowBack1,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).profile,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: AppColors.white),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.grey[700],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 100.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.backGroundL,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              ProfileSetting(profileViewModel),
            ],
          ),
        ),
      ),
    );
  }
}
