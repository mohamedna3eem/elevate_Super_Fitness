import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_states.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MainHomeViewModel viewModel;

  setUp(() {
    viewModel = MainHomeViewModel();
  });

  group('test MainHomeViewModel', () {
    test('initial state is correct', () {
      expect(viewModel.state.selectedIndex, 0);
      expect(viewModel.state.isBottomBarVisible, true);
    });

    blocTest<MainHomeViewModel, MainHomeStates>(
      'OnBottomNavBarTappedEvent emits correct state',
      build: () => viewModel,
      act: (cubit) => cubit.doIntent(OnBottomNavBarTappedEvent(index: 2)),
      expect: () => [
        const MainHomeStates(selectedIndex: 2, isBottomBarVisible: true),
      ],
    );

    blocTest<MainHomeViewModel, MainHomeStates>(
      'OnPageChangedEvent updates selected index',
      build: () => viewModel,
      act: (cubit) => cubit.doIntent(OnPageChangedEvent(1)),
      expect: () => [
        const MainHomeStates(selectedIndex: 1, isBottomBarVisible: true),
      ],
    );

    blocTest<MainHomeViewModel, MainHomeStates>(
      'Scroll down hides bottom bar',
      build: () => viewModel,
      act: (cubit) => cubit.doIntent(OnScrollUpdateEvent(100, 10)),
      expect: () => [
        const MainHomeStates(selectedIndex: 0, isBottomBarVisible: false),
      ],
    );

    blocTest<MainHomeViewModel, MainHomeStates>(
      'Scroll up shows bottom bar after hidden',
      build: () {
        viewModel.emit(const MainHomeStates(isBottomBarVisible: false));
        return viewModel;
      },
      act: (cubit) => cubit.doIntent(OnScrollUpdateEvent(100, -10)),
      expect: () => [
        const MainHomeStates(selectedIndex: 0, isBottomBarVisible: true),
      ],
    );

    test('close runs without errors', () async {
      await viewModel.close();
      expect(true, true);
    });
  });
}
