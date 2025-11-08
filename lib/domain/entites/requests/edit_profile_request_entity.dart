import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import '../../../api/models/requests/edit_profile_request.dart';

import 'edit_profile_request_entity.auto_mappr.dart';

@AutoMappr([
  MapType<EditProfileRequestEntity, EditProfileRequest>(),
])
class EditProfileRequestEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? weight;
  final String? activityLevel;
  final String? goal;

  EditProfileRequestEntity ({
    this.firstName,
    this.lastName,
    this.email,
    this.weight,
    this.activityLevel,
    this.goal,
  });

  final mapper = const $EditProfileRequestEntity();
}