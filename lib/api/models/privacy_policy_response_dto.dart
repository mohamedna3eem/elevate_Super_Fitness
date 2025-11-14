import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'privacy_policy_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PrivacyPolicyResponseDto extends Equatable {
  @JsonKey(name: "privacy_policy")
  final List<PrivacySectionDto> privacyPolicy;

  const PrivacyPolicyResponseDto({required this.privacyPolicy});

  factory PrivacyPolicyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyPolicyResponseDtoToJson(this);

  @override
  List<Object?> get props => [privacyPolicy];
}

@JsonSerializable(explicitToJson: true)
class PrivacySectionDto extends Equatable {
  final String section;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? style;

  @JsonKey(name: "sub_sections")
  final List<PrivacySubSectionDto>? subSections;

  const PrivacySectionDto({
    required this.section,
    this.content,
    this.title,
    this.style,
    this.subSections,
  });

  factory PrivacySectionDto.fromJson(Map<String, dynamic> json) =>
      _$PrivacySectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacySectionDtoToJson(this);

  @override
  List<Object?> get props => [section, content, title, style, subSections];
}

@JsonSerializable()
class PrivacySubSectionDto extends Equatable {
  final String type;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? content;

  const PrivacySubSectionDto({
    required this.type,
    this.title,
    this.content,
  });

  factory PrivacySubSectionDto.fromJson(Map<String, dynamic> json) =>
      _$PrivacySubSectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacySubSectionDtoToJson(this);

  @override
  List<Object?> get props => [type, title, content];
}
