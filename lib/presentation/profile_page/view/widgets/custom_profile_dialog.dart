import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../generated/l10n.dart';

abstract class CustomProfileDialog {

  static void showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: AppColors.backGroundL.withValues(alpha: .8),
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Icon(Icons.close, color: AppColors.white),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(child: Column(
                    spacing: 8.h,
                      children: [
                    buildText(context: context, text: AppLocalizations.of(context).HelpAndSupport, fontSize: 24.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).HowCanWeHelpYouToday, fontSize: 16.sp, fontWeight: FontWeight.normal),
                    buildText(context: context, text: AppLocalizations.of(context).GetInTouch, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).EmailSupport, fontSize: 18.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).GetAResponseWithin24Hours, fontSize: 14.sp, fontWeight: FontWeight.normal),
                    buildText(context: context, text: AppLocalizations.of(context).CallUs, fontSize: 18.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).Available9AM5PMPST, fontSize: 14.sp, fontWeight: FontWeight.normal),
                    buildText(context: context, text: AppLocalizations.of(context).FrequentlyAskedQuestions, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).HowDoesTheAITrainerApexWork, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).OurAITrainerApexUsesYourProvidedData, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).HowDoILogAMeal, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).NavigateToTheNutritionTab, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).HowDoIManageMySubscription, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).YouCanManageYourSubscription, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).IsMyVideoDataForFormCorrectionPrivate, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    buildText(context: context, text: AppLocalizations.of(context).YesYourPrivacyIsOurPriority, fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ])),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: AppColors.backGroundL.withValues(alpha: .8),
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Icon(Icons.close, color: AppColors.white),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(child: Column(
                      spacing: 8.h,
                      children: [
                        buildText(context: context, text: AppLocalizations.of(context).PrivacyPolicy, fontSize: 24.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).LastUpdatedNovember12025, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).WelcomeToApexFitness, fontSize: 16.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).InformationWeCollect, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).PersonalDataYouProvide, fontSize: 16.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).WeCollectInformationYouProvideDirectly, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).AITrainerAndHealthData, fontSize: 16.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ToUseTheAITrainerYouMayProvideSensitiveData, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).AutomaticUsageData, fontSize: 16.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).WeAutomaticallyCollectInformationAboutYourDevice, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeUseYourInformation, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeUseInfo1, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeUseInfo2, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeUseInfo3, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeUseInfo4, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeUseInfo5, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeShareYourInformation, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeShareInfo1, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeShareInfo2, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).HowWeShareInfo3, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).WeDoNotSellYourPersonalOrSensitiveHealthData, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).DataSecurity, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).WeImplementReasonableSecurityMeasures, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).YourDataRights, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).DataRights1, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).DataRights2, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).DataRights3, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ChildrensPrivacy, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ChildrensPrivacyContent, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ChangesToThisPolicy, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ChangesToThisPolicyContent, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ContactUs, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ContactUs1, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ContactUsEmail, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ContactUsAddress, fontSize: 14.sp, fontWeight: FontWeight.normal),
                      ])),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showSecurityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: AppColors.backGroundL.withValues(alpha: .8),
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Icon(Icons.close, color: AppColors.white),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(child: Column(
                      spacing: 8.h,
                      children: [
                        buildText(context: context, text: AppLocalizations.of(context).UserRolesAndPermissions, fontSize: 24.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ManageAccessAndCapabilities, fontSize: 16.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).AvailableRoles, fontSize: 20.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).SuperAdmin, fontSize: 20.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).SuperAdminDescription, fontSize: 16.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ModifySystemConfiguration, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ModifySystemConfigurationDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).FullUserManagement, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).FullUserManagementDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).FullContentControl, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).FullContentControlDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ManageBillingAndSubscriptions, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ManageBillingAndSubscriptionsDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).UserManager, fontSize: 20.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).UserManagerDescription, fontSize: 16.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).CreateUsers, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).CreateUsersDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).EditUserProfiles, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).EditUserProfilesDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).DeleteDeactivateUsers, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).DeleteDeactivateUsersDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ViewUserList, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ViewUserListDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ContentEditor, fontSize: 20.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ContentEditorDescription, fontSize: 16.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).CreateContent, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).CreateContentDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).EditOwnContent, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).EditOwnContentDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).PublishContent, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).PublishContentDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).UploadMedia, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).UploadMediaDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).Viewer, fontSize: 20.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ViewerDescription, fontSize: 16.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ReadContent, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ReadContentDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),
                        buildText(context: context, text: AppLocalizations.of(context).ViewDashboards, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        buildText(context: context, text: AppLocalizations.of(context).ViewDashboardsDescription, fontSize: 14.sp, fontWeight: FontWeight.normal),

                      ])),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget buildText({
    required BuildContext context,
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return Text(
      text,
      style: context.bodyMedium?.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
    );
  }
}
