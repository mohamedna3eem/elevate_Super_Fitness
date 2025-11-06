import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ExerciseLevelsTabBarItem extends StatelessWidget {
  bool isSelected;
  String exerciseLevelName;
  ExerciseLevelsTabBarItem({super.key,required this.isSelected,required this.exerciseLevelName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: isSelected ? const BorderRadius.all(Radius.circular(20)):null,
        color: isSelected? AppColors.mainColorL : Colors.transparent
      ),
      child: Center(
        child: Text(exerciseLevelName,style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w700,
          color: isSelected? AppColors.pureWhite : AppColors.backGroundL[90]
        ),),
      ),
    );
  }
}