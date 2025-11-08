import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/core/constants/app_icons.dart';
import 'package:elevate_super_fitness/core/constants/app_images.dart';
import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view/widgets/profile_setting.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_states.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_view_model.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/profile_events.dart';
import '../widgets/profile_skleton.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileViewModel>()..doIntent(ProfileEvent()),
      child: BlocBuilder<ProfileViewModel, ProfileStates>(
        builder: (context, state) {
          if (state.status == ProfileStatus.loading) {
            return ProfileSkeleton(context.read<ProfileViewModel>());
          }

          if (state.status == ProfileStatus.error) {
            return Center(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteNames.login),
                child: const Text(
                  "Error loading profile",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          if (state.status == ProfileStatus.success) {
            return SingleChildScrollView(
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: ExtendedImage.network(
                            state.profileResponseEntity?.photo ??
                                AppImages.defaultImage,
                            width: 100.h,
                            height: 100.h,
                            fit: BoxFit.cover,
                            cache: true,
                            loadStateChanged: (imgState) {
                              switch (imgState.extendedImageLoadState) {
                                case LoadState.loading:
                                  return const CircularProgressIndicator();
                                case LoadState.failed:
                                  return const Icon(Icons.error);
                                default:
                                  return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "${state.profileResponseEntity?.firstName ?? ''} ${state.profileResponseEntity?.lastName ?? ''}",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ProfileSetting(context.read<ProfileViewModel>()),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
