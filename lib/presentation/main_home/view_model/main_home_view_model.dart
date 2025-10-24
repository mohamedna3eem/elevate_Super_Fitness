import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainHomeViewModel extends Cubit<MainHomeStates> {
  MainHomeViewModel() : super(const MainHomeStates());

  final PageController pageController = PageController();

  void doIntent(MainHomeEvent event) {
    switch (event) {
      case OnBottomNavBarTappedEvent():
        _bottomNavBarOnTap(event.index);
        break;
      case OnPageChangedEvent():
        _onPageChanged(event.index);
        break;
      case OnScrollUpdateEvent():
        _handleScroll(event.pixels, event.scrollDelta);
        break;
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
    if (pixels > 50 &&
        delta > 0 &&
        state.isBottomBarVisible) {
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
