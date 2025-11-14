import 'package:elevate_super_fitness/domain/entites/help_section_response_entity.dart';
import 'package:equatable/equatable.dart';

class HelpResponseEntity extends Equatable {
  final List<HelpSectionEntity> helpScreenContent;

  const HelpResponseEntity({required this.helpScreenContent});

  @override
  List<Object?> get props => [helpScreenContent];
}
