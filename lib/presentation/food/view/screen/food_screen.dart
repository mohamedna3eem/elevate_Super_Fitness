import 'package:elevate_super_fitness/core/custom_widget/custom_food_bg.dart';
import 'package:elevate_super_fitness/presentation/food/view/widget/food_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../view_model/food_events.dart';
import '../../view_model/food_view_model.dart';

class FoodScreen extends StatelessWidget {
  final int? categoryIndex;
  const FoodScreen({super.key, this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<FoodViewModel>()..doIntent(GetMealsCategoriesFoodEvent()),
        child: CustomFoodBg(
          child: FoodViewBody(categoryIndex: categoryIndex ?? 0),
        ),
      ),
    );
  }
}
