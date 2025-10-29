import 'package:equatable/equatable.dart';

class MuscleGroupEntity extends Equatable {
  final String? id;
  final String? name;

  const MuscleGroupEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
