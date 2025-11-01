import 'package:elevate_super_fitness/api/models/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_response.dart';
import 'package:elevate_super_fitness/api/models/workout_response/workout_response.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_data.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_response.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';

import '../models/workout_response/muscles_data.dart';


extension WorkoutMapper on WorkoutResponseDto{

  WorkoutResponseEntity toEntity(){
    return WorkoutResponseEntity(
      message: message,
      musclesGroup:musclesGroup?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension MusclesMapper on MusclesGroupDto{
  MusclesGroupEntity toEntity(){
    return MusclesGroupEntity(
      id: id,
      name: name
    );
  }
}

extension MucslesByIdMapper on MusclesByIdDto{

  MusclesByIdEntity toEntity(){
    return MusclesByIdEntity(
      message: message,
      muscleGroup:  muscleGroup?.toEntity(),
      muscles: muscles?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension MucslesDataMapper on MusclesDto{

  MusclesEntity toEntity(){
    return MusclesEntity(
   image: image,
      id: id,
      name: name,
    );
  }
}