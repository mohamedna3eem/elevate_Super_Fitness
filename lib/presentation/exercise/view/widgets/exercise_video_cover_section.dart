import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/core/constants/app_icons.dart';
import 'package:elevate_super_fitness/core/constants/app_images.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseVideoCoverSection extends StatelessWidget {
  const ExerciseVideoCoverSection({super.key, required this.exciseName});
  final String exciseName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 344.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.chestExerciseImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00000000), Color(0xFF242424)],
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: InkWell(
            onTap: Navigator.of(context).maybePop,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.mainColorL,
              child: const ImageIcon(
                AssetImage(AppIcons.arrowBack),
                size: 10,
                color: AppColors.pureWhite,
              ),
            ),
          ),
        ),
        Positioned(
          top: 195,
          right: 16,
          left: 16,
          bottom: 6,
          child: SizedBox(
            width: double.infinity,
            height: 140,
            child: Column(
              children: [
                Text(
                  "$exciseName Exercise",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.pureWhite,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  AppLocalizations.of(
                    context,
                  ).loremIpsumDolorSitAmetConsecteturTempusVolutpatUtNisiMorbi,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.pureWhite),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 52,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.backGroundL.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(
                          width: 0.5,
                          color: AppColors.backGroundL[90]!,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).min30,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: AppColors.pureWhite),
                        ),
                      ),
                    ),
                    Container(
                      width: 52,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.backGroundL.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(
                          width: 0.5,
                          color: AppColors.backGroundL[90]!,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).cal130,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.mainColorL,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
