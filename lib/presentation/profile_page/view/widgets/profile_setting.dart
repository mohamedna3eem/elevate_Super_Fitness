import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/core/constants/app_icons.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_dialog.dart';
import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/core/module/secure_storage_module.dart';
import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view/widgets/CustomprofileRow.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view/widgets/select_language.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_events.dart';
import 'package:elevate_super_fitness/presentation/profile_page/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileSetting extends StatelessWidget {
  final ProfileViewModel profileViewModel;
  const ProfileSetting(this.profileViewModel, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        color: AppColors.backGroundL,
      ),
      padding: EdgeInsets.all(8.r),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          InkWell(
            onTap: () async {
              final navigation = await Navigator.pushNamed(
                context,
                RouteNames.editProfile,
              );
              if (navigation == true) {
                profileViewModel.doIntent(ProfileEvent());
              }
            },
            child: CustomProfileRow(
              icon: AppIcons.profile,
              tittle: AppLocalizations.of(context).editProfile,
              icon2: Icons.arrow_forward_ios,
            ),
          ),
          SizedBox(height: 8.h),
          Container(height: 1, color: AppColors.gray),
          SizedBox(height: 10.h),
          CustomProfileRow(
            icon: AppIcons.change,
            tittle: AppLocalizations.of(context).changePassword,
            icon2: Icons.arrow_forward_ios,
            onTap: () =>
                Navigator.pushNamed(context, RouteNames.changePassword),
          ),
          SizedBox(height: 8.h),
          Container(height: 1, color: AppColors.gray),
          SizedBox(height: 10.h),
          const SelectLanguage(),

          SizedBox(height: 8.h),
          Container(height: 1, color: AppColors.gray),
          SizedBox(height: 8.h),
          InkWell(
            onTap: () {},
            child: CustomProfileRow(
              icon: AppIcons.lockSetting,
              tittle: AppLocalizations.of(context).security,
              icon2: Icons.arrow_forward_ios,
            ),
          ),
          SizedBox(height: 8.h),
          Container(height: 1, color: AppColors.gray),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {},
            child: CustomProfileRow(
              icon: AppIcons.securityWarning,
              tittle: AppLocalizations.of(context).privacyPolicy,
              icon2: Icons.arrow_forward_ios,
            ),
          ),
          SizedBox(height: 8.h),
          Container(height: 1, color: AppColors.gray),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {},
            child: CustomProfileRow(
              icon: AppIcons.help,
              tittle: AppLocalizations.of(context).help,
              icon2: Icons.arrow_forward_ios,
            ),
          ),
          SizedBox(height: 8.h),
          Container(height: 1, color: AppColors.gray),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              CustomDialog.fitnessPositiveAndNegativeButton(
                context: context,
                message: AppLocalizations.of(context).logout,
                positiveOnClick: () async {
                  Navigator.pushNamedAndRemoveUntil(
                    // ignore: use_build_context_synchronously
                    context,
                    RouteNames.login,
                    (route) => true,
                  );
                  profileViewModel.doIntent(LogoutEvent());
                  final secureStorageModule = getIt.get<FlutterSecureStorage>();
                  await secureStorageModule.delete(
                    key: ConstKeys.keyRememberMe,
                  );
                  await secureStorageModule.delete(key: ConstKeys.keyUserToken);
                },
              );
            },
            child: Row(
              children: [
                Image.asset(AppIcons.logout, color: AppColors.mainColorL),
                SizedBox(width: 16.w),
                Text(
                  AppLocalizations.of(context).logout,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.mainColorL),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios, color: AppColors.mainColorL),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(height: 1, color: AppColors.gray),
        ],
      ),
    );
  }
}
