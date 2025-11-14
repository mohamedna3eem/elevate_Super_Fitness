import 'package:equatable/equatable.dart';

class PrivacyPolicyResponseEntity extends Equatable {
  final List<PrivacySectionEntity> privacyPolicy;

  const PrivacyPolicyResponseEntity({required this.privacyPolicy});

  @override
  List<Object?> get props => [privacyPolicy];
}

class PrivacySectionEntity extends Equatable {
  final String section;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? style;
  final List<PrivacySubSectionEntity>? subSections;

  const PrivacySectionEntity({
    required this.section,
    this.content,
    this.title,
    this.style,
    this.subSections,
  });

  @override
  List<Object?> get props =>
      [section, content, title, style, subSections];
}

class PrivacySubSectionEntity extends Equatable {
  final String type;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? content;

  const PrivacySubSectionEntity({
    required this.type,
    this.title,
    this.content,
  });

  @override
  List<Object?> get props => [type, title, content];
}
