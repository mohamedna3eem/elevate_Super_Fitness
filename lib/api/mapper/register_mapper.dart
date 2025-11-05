import 'package:elevate_super_fitness/api/models/requests/register_request.dart';
import 'package:elevate_super_fitness/domain/entites/requests/register_request_entity.dart';

extension RegisterRequestMapper on RegisterRequestEntity {
  RegisterRequest toRequest() {
    return RegisterRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      gender: gender,
      height: height,
      weight: weight,
      age: age,
      goal: goal,
      activityLevel: activityLevel,
    );
  }
}
