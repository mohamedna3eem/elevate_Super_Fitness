import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/presentation/exercise/view/widgets/exercise_view_body.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundL[10],
      body: const SafeArea(child: ExerciseViewBody(primeMoverMuscleId: "67c8499726895f87ce0aa9bc",)),
    );
  }
}