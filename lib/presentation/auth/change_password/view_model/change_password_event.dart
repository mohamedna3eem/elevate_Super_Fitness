import 'package:elevate_super_fitness/core/enums/change_password.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';

sealed class ChangePasswordEvent {}

class ChangePasswordExecuteEvent extends ChangePasswordEvent {
  final ChangePasswordRequestEntity request;

  ChangePasswordExecuteEvent({required this.request});
}

class ChangePasswordShowIconEvent extends ChangePasswordEvent {
  final ChangePasswordEnum enumEvent;

  ChangePasswordShowIconEvent({required this.enumEvent});
}
