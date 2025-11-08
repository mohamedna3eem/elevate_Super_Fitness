import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/core/custom_widget/test_app_wrapper.dart';
import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/change_password_use_case.dart';
import 'package:elevate_super_fitness/presentation/auth/change_password/view/screen/change_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy/profile_dummy_data.dart';
import 'change_password_view_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() {
  group("change password page", () {
    final responseEntity = ProfileDummyData.dummyChangePasswordResponseEntity;
    final responseError = ProfileDummyData.dummyException;
    late ChangePasswordUseCase useCase;
    useCase = MockChangePasswordUseCase();
    setUpAll(() {
      configureDependencies();
      useCase = MockChangePasswordUseCase();
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiSuccessResult(responseEntity),
      );
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiErrorResult(responseError),
      );
    });
    testWidgets('change password view test behavior page ...', (
      WidgetTester tester,
    ) async {
      when(
        useCase.call(
          const ChangePasswordRequestEntity(
            newPassword: "Az147852@@@",
            password: "Az147852@@",
          ),
        ),
      ).thenAnswer(
        (realInvocation) async =>
            ApiSuccessResult<ChangePasswordResponseEntity>(responseEntity),
      );
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.pumpWidget(
        const TestAppWrapper(child: ChangePasswordView()),
      );
      await tester.tap(
        find.byKey(const Key(WidgetsKeys.kChangePasswordScreenButtonDoneKey)),
      );
      await tester.pump();
      expect(find.byType(Text), findsNWidgets(9));
      await tester.enterText(
        find.byKey(
          const Key(WidgetsKeys.kChangePasswordScreenOldPasswordFieldKey),
        ),
        "Az147852@@",
      );
      await tester.enterText(
        find.byKey(
          const Key(WidgetsKeys.kChangePasswordScreenNewPasswordFieldKey),
        ),
        "Az147852@@@",
      );
      await tester.enterText(
        find.byKey(
          const Key(WidgetsKeys.kChangePasswordScreenConfirmPasswordFieldKey),
        ),
        "Az147852@@@",
      );
      await tester.tap(
        find.byKey(const Key(WidgetsKeys.kChangePasswordScreenButtonDoneKey)),
      );
      await tester.pumpAndSettle();
      expect(
        find.byWidgetPredicate((widget) => widget is DashedCircularProgressBar),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      expect(find.byType(BackdropFilter), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
    testWidgets('change password view test structure page ...', (
      WidgetTester tester,
    ) async {
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.pumpWidget(
        const TestAppWrapper(child: ChangePasswordView()),
      );
      expect(
        find.byKey(const Key(WidgetsKeys.kChangePasswordScreenWidgetTitleKey)),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key(WidgetsKeys.glassShapeWidgetKey)),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key(WidgetsKeys.kChangePasswordScreenTitleTextKey)),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key(WidgetsKeys.kChangePasswordScreenSubtitleTextKey)),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key(WidgetsKeys.kChangePasswordSectionFormFieldKey)),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key(WidgetsKeys.kChangePasswordScreenOldPasswordFieldKey),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key(
            WidgetsKeys.kChangePasswordScreenPreIconOldPasswordFieldKey,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key(WidgetsKeys.kChangePasswordScreenNewPasswordFieldKey),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key(
            WidgetsKeys.kChangePasswordScreenPreIconNewPasswordFieldKey,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key(WidgetsKeys.kChangePasswordScreenConfirmPasswordFieldKey),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key(
            WidgetsKeys.kChangePasswordScreenPreIconConfirmPasswordFieldKey,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(const Key(WidgetsKeys.kChangePasswordScreenButtonDoneKey)),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key(WidgetsKeys.kChangePasswordScreenTextButtonDoneKey),
        ),
        findsOneWidget,
      );
      expect(find.byType(Text), findsNWidgets(6));
    });
  });
}
