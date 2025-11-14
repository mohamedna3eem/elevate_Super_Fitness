import 'package:equatable/equatable.dart';

class HelpSectionEntity extends Equatable {
  final String section;
  final dynamic content;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? style;

  const HelpSectionEntity({
    required this.section,
    this.content,
    this.title,
    this.style,
  });

  @override
  List<Object?> get props => [section, content, title, style];
}