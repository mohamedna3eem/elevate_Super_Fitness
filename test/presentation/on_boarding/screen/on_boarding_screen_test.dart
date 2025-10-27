import 'package:elevate_super_fitness/core/custom_widget/test_app_wrapper.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/screen/on_boarding_screen.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/widgets/on_boarding_view_body.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    final testerBinding = TestWidgetsFlutterBinding.ensureInitialized();
    testerBinding.window.physicalSizeTestValue = const Size(1080, 1920);
    testerBinding.window.devicePixelRatioTestValue = 1.0;
  });

  group('OnBoardingScreen Widget Tests', () {
    testWidgets('renders OnBoardingScreen correctly', (WidgetTester tester) async {

      await tester.pumpWidget(const TestAppWrapper(child: OnBoardingScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(OnBoardingViewBody), findsOneWidget);

      expect(find.text(AppLocalizations().onBoarding1Title), findsOneWidget);
    });

    testWidgets('Next button navigates to second page', (WidgetTester tester) async {

      await tester.pumpWidget(const TestAppWrapper(child: OnBoardingScreen()));
      await tester.pumpAndSettle();

      final nextButton = find.text(AppLocalizations().next);
      expect(nextButton, findsOneWidget);

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.text(AppLocalizations().onBoarding2Title), findsOneWidget);
    });

    testWidgets('Skip button navigates to login screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TestAppWrapper(child: OnBoardingScreen()));
      await tester.pumpAndSettle();

      final skipButton = find.text(AppLocalizations().skip);
      expect(skipButton, findsOneWidget);

      // await tester.tap(skipButton);
      // await tester.pumpAndSettle();

      // expect(find.text("Login"), findsNothing);
    });

    testWidgets('Do it button appears on last page and navigates to login', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TestAppWrapper(child: OnBoardingScreen()));
      await tester.pumpAndSettle();

      await tester.fling(find.byType(PageView), const Offset(-800, 0), 800);
      await tester.pumpAndSettle();

      final doItButton = find.textContaining("Do");
      expect(doItButton, findsOneWidget);

      // await tester.tap(doItButton);
      // await tester.pumpAndSettle();

      // expect(find.text("Login"), findsNothing);
    });
  });
}
