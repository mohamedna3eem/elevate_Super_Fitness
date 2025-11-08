import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/provider/app_config.dart';
import '../../../../generated/l10n.dart';
import 'custom_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    final appConfig = Provider.of<AppConfigProvider>(context);
    final currentLang = appConfig.local ?? "en";

    final bool isEnglish = currentLang == "en";

    final String langName = isEnglish ? "English" : "العربية";

    return Row(
      children: [
        Image.asset(AppIcons.language, color: AppColors.mainColorL),
        SizedBox(width: 16.w),
        Text(
          AppLocalizations.of(context).selectLanguage,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              builder: (context) => const CustomButtonSheet(),
            );
          },
          child: Text(
            " ($langName)",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.mainColorL),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 30.w,
          height: 15.h,
          child: Transform.scale(
            scale: 0.85,
            child: Switch(
              value: isEnglish,
              onChanged: (value) {
                appConfig.changeLocal(value ? "en" : "ar");
              },
              activeColor: AppColors.white,
              inactiveThumbColor: AppColors.white,
              activeTrackColor: AppColors.mainColorL,
              inactiveTrackColor: AppColors.lightGray.withAlpha(100),
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
