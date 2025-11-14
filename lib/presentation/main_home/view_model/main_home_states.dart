import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:equatable/equatable.dart';

class MainHomeStates extends Equatable {
  final int selectedIndex;
  final bool isBottomBarVisible;
  final BaseState<UserInfoEntity>? userInfo;
  const MainHomeStates({
    this.selectedIndex = 0,
    this.isBottomBarVisible = true,
    this.userInfo,
  });

  MainHomeStates copyWith({
    int? selectedIndex,
    bool? isBottomBarVisible,
    BaseState<UserInfoEntity>? userInfo,
  }) {
    return MainHomeStates(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isBottomBarVisible: isBottomBarVisible ?? this.isBottomBarVisible,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, isBottomBarVisible, userInfo];
}
