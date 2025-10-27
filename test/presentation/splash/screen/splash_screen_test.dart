import 'package:elevate_super_fitness/core/custom_widget/test_app_wrapper.dart';
import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/presentation/splash/screen/splash_screen.dart';
import 'package:elevate_super_fitness/presentation/splash/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/screen/on_boarding_screen.dart';

void main() {
  setUpAll(() {
    final testerBinding = TestWidgetsFlutterBinding.ensureInitialized();
    testerBinding.window.physicalSizeTestValue = const Size(1080, 1920);
    testerBinding.window.devicePixelRatioTestValue = 1.0;
    configureDependencies();
  });

  group('SplashScreen Widget Tests', () {
    testWidgets('renders logo correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const TestAppWrapper(child: SplashViewBody()));

      expect(find.byType(SplashViewBody), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
      final containerFinder = find.byWidgetPredicate((widget) {
        if (widget is Container && widget.decoration is BoxDecoration) {
          final BoxDecoration decoration = widget.decoration as BoxDecoration;
          return decoration.image != null;
        }
        return false;
      });
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('navigates to OnBoardingScreen after delay', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const TestAppWrapper(child: SplashScreen()));

      expect(find.byType(SplashViewBody), findsOneWidget);
    });
  });
}
