import 'package:elevate_super_fitness/api/models/exercise_widget_model.dart';
import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:elevate_super_fitness/presentation/exercise/view/widgets/exercise_view_body.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key, required this.exerciseModel});
  final ExerciseWidgetModel exerciseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundL[10],
      body: SafeArea(
        child: ExerciseViewBody(exerciseWidgetModel: exerciseModel),
      ),
    );
  }
}
