import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_user_logged_data_use_case.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class MainHomeViewModel extends Cubit<MainHomeStates> {
  MainHomeViewModel(this._userLoggedDataUseCase)
    : super(const MainHomeStates());
  final GetUserLoggedDataUseCase _userLoggedDataUseCase;

  final PageController pageController = PageController();
  String? selectedTabIdWorkouts = "";
  void doIntent(MainHomeEvent event) {
    switch (event) {
      case OnBottomNavBarTappedEvent():
        _bottomNavBarOnTap(event.index);
        selectedTabIdWorkouts = event.selectedTabId;
        break;
      case OnPageChangedEvent():
        _onPageChanged(event.index);
        break;
      case OnScrollUpdateEvent():
        _handleScroll(event.pixels, event.scrollDelta);
        break;
      case GetUserInfoMainHomeEvent():
        _getUserData();
    }
  }

  Future<void> _getUserData() async {
    emit(state.copyWith(userInfo: BaseState.loading()));
    final result = await _userLoggedDataUseCase.call();
    switch (result) {
      case ApiSuccessResult<UserInfoEntity>():
        emit(state.copyWith(userInfo: BaseState.success(result.data)));
      case ApiErrorResult<UserInfoEntity>():
        emit(state.copyWith(userInfo: BaseState.error(result.errorMessage)));
    }
  }

  void _bottomNavBarOnTap(int index) {
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
    emit(state.copyWith(selectedIndex: index));
  }

  void _onPageChanged(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void _handleScroll(double pixels, double delta) {
    if (pixels > 50 && delta > 0 && state.isBottomBarVisible) {
      emit(state.copyWith(isBottomBarVisible: false));
    } else if (delta < 0 && !state.isBottomBarVisible) {
      emit(state.copyWith(isBottomBarVisible: true));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
