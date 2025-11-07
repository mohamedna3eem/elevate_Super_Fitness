import 'package:elevate_super_fitness/api/models/logout/logout_resonse.dart';
import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';

extension LogoutMapper on LogOutResponseDto{
  LogOutResponseEntity toEntity(){
    return LogOutResponseEntity(
      message: message
    );
  }
}