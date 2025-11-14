import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'help_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class HelpResponseDto extends Equatable {
  final List<HelpSectionDto> helpScreenContent;

  const HelpResponseDto({required this.helpScreenContent});

  factory HelpResponseDto.fromJson(Map<String, dynamic> json) =>
      _$HelpResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HelpResponseDtoToJson(this);

  @override
  List<Object?> get props => [helpScreenContent];
}

@JsonSerializable(explicitToJson: true)
class HelpSectionDto extends Equatable {
  final String section;
  final dynamic content;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? style;

  const HelpSectionDto({
    required this.section,
    this.content,
    this.title,
    this.style,
  });

  factory HelpSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HelpSectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HelpSectionDtoToJson(this);

  @override
  List<Object?> get props => [section, content, title, style];
}
