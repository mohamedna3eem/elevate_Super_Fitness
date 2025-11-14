import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_user_logged_data_use_case.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_states.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../smart_coach_page/view_model/smart_coach_view_model_test.mocks.dart';

@GenerateMocks([GetUserLoggedDataUseCase])
void main() {
  late GetUserLoggedDataUseCase userLoggedDataUseCase;
  late MainHomeViewModel viewModel;

  setUp(() {
    userLoggedDataUseCase = MockGetUserLoggedDataUseCase();
    viewModel = MainHomeViewModel(userLoggedDataUseCase);
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
