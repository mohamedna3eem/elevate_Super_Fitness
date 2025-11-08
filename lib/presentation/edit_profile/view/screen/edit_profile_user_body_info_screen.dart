import 'package:elevate_super_fitness/core/custom_widget/custom_auth_bg.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_radio_list.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_wheel_page.dart';
import 'package:elevate_super_fitness/core/enums/level_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/goal_enum.dart';
import '../../../../generated/l10n.dart';
import '../../view_model/edit_profile_events.dart';
import '../../view_model/edit_profile_view_model.dart';

enum EditProfileUserBodyInfoPagesEnum { weight, goal, level }

class EditProfileUserBodyInfoScreen extends StatelessWidget {
  final EditProfileUserBodyInfoPagesEnum page;

  EditProfileUserBodyInfoScreen({super.key, required this.page});

  late int selectedWeight;
  late final ValueNotifier<GoalEnum> selectedGoal;
  late final ValueNotifier<LevelEnum> selectedLevel;

  @override
  Widget build(BuildContext context) {
    final editProfileViewModel = context.read<EditProfileViewModel>();
    selectedWeight = editProfileViewModel.selectedWeight;
    selectedGoal = ValueNotifier(editProfileViewModel.selectedGoal);
    selectedLevel = ValueNotifier(editProfileViewModel.selectedLevel);

    return Scaffold(
      body: CustomAuthBg(
        child: Builder(
          builder: (context) {
            switch (page) {
              case EditProfileUserBodyInfoPagesEnum.weight:
                return CustomWheelPage(
                  initValue: selectedWeight,
                  minValue: 30,
                  maxValue: 200,
                  title: AppLocalizations.of(context).whatIsYourWeight,
                  desc: AppLocalizations.of(
                    context,
                  ).thisHelpsUsCreateYourPersonalizedPlan,
                  wheelTitle: AppLocalizations.of(context).kg,
                  onChanged: (weight) {
                    selectedWeight = weight;
                  },
                  buttonTitle: AppLocalizations.of(context).done,
                  onButtonClick: () {
                    if (selectedWeight != editProfileViewModel.selectedWeight) {
                      editProfileViewModel.selectedWeight = selectedWeight;
                      editProfileViewModel.doIntent(
                        UpdateUserProfileEvent(isBodyInfo: true),
                      );
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                );
              case EditProfileUserBodyInfoPagesEnum.goal:
                return ValueListenableBuilder(
                  valueListenable: selectedGoal,
                  builder: (context, value, child) {
                    return CustomRadioList(
                      values: GoalEnum.values,
                      selectedValue: value,
                      labelBuilder: (goal) => goal.displayName,
                      title: AppLocalizations.of(context).whatIsYourGoal,
                      desc: AppLocalizations.of(
                        context,
                      ).thisHelpsUsCreateYourPersonalizedPlan,
                      onChanged: (goal) {
                        if (goal != null) {
                          selectedGoal.value = goal;
                        }
                      },
                      buttonTitle: AppLocalizations.of(context).done,
                      onButtonClick: () {
                        if (value != editProfileViewModel.selectedGoal) {
                          editProfileViewModel.selectedGoal = value;
                          editProfileViewModel.doIntent(
                            UpdateUserProfileEvent(isBodyInfo: true),
                          );
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  },
                );
              case EditProfileUserBodyInfoPagesEnum.level:
                return ValueListenableBuilder(
                  valueListenable: selectedLevel,
                  builder: (context, value, child) {
                    return CustomRadioList(
                      values: LevelEnum.values,
                      selectedValue: value,
                      labelBuilder: (level) => level.displayName,
                      title: AppLocalizations.of(
                        context,
                      ).yourRegularPhysicalActivityLevel,
                      desc: "",
                      onChanged: (level) {
                        if (level != null) {
                          selectedLevel.value = level;
                        }
                      },
                      buttonTitle: AppLocalizations.of(context).done,
                      onButtonClick: () {
                        if (value != editProfileViewModel.selectedLevel) {
                          editProfileViewModel.selectedLevel = value;
                          editProfileViewModel.doIntent(
                            UpdateUserProfileEvent(isBodyInfo: true),
                          );
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
