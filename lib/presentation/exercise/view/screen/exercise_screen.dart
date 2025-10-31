import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/presentation/exercise/view/widgets/exercise_view_body.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({
    super.key,
    required this.primeMoverMuscleId,
    required this.exciseName,
  });
  final String primeMoverMuscleId, exciseName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundL[10],
      body: SafeArea(
        child: ExerciseViewBody(
          primeMoverMuscleId: primeMoverMuscleId,
          exciseName: exciseName,
        ),
      ),
    );
  }
}
