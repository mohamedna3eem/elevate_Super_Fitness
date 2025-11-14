import 'dart:convert';

import 'package:elevate_super_fitness/api/models/help_response_dto.dart';
import 'package:elevate_super_fitness/api/models/privacy_policy_response_dto.dart';
import 'package:elevate_super_fitness/api/models/security_roles_config_response_dto.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalData {
  Future<HelpResponseDto> getHlpData() async {
    final jsonString = await rootBundle.loadString(Endpoints.helpLocalData);
    final json = jsonDecode(jsonString);
    final response = HelpResponseDto.fromJson(json);
    return response;
  }

  Future<PrivacyPolicyResponseDto> getPrivacyPolicyData() async {
    final jsonString = await rootBundle.loadString(
      Endpoints.privacyAndSecurityLocalData,
    );
    final json = jsonDecode(jsonString);
    final response = PrivacyPolicyResponseDto.fromJson(json);
    return response;
  }

  Future<SecurityRolesConfigResponseDto> getSecurityRolesConfigData() async {
    final jsonString = await rootBundle.loadString(
      Endpoints.privacyAndSecurityLocalData,
    );
    final json = jsonDecode(jsonString);
    final response = SecurityRolesConfigResponseDto.fromJson(json);
    return response;
  }
}
