import 'package:elevate_super_fitness/core/custom_widget/custom_food_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../view_model/edit_profile_events.dart';
import '../../view_model/edit_profile_view_model.dart';
import '../widget/edit_profile_view_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) =>
            getIt<EditProfileViewModel>()..doIntent(GetUserDataProfileEvent()),
        child: CustomFoodBg(child: EditProfileViewBody()),
      ),
    );
  }
}
