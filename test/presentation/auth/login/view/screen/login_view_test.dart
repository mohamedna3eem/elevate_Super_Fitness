import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/core/custom_widget/test_app_wrapper.dart';
import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view/screen/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    configureDependencies();
  });
  testWidgets('login view ...', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(const TestAppWrapper(child: LoginView()));
    expect(
      find.byKey(const Key(WidgetsKeys.kLoginScreenLoginTitleTextKey)),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetsKeys.kLoginScreenHeyThereText)),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetsKeys.kLoginScreenWelcomeBackText)),
      findsOneWidget,
    );
    expect(
      find.byKey(
        const Key(WidgetsKeys.kLoginScreenTextButtonForgetPasswordKey),
      ),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetsKeys.kLoginScreenPasswordFormFiledKey)),
      findsOneWidget,
    );
    expect(
      find.byKey(
        const Key(WidgetsKeys.kLoginScreenPrefixIconEmailFormFiledKey),
      ),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetsKeys.kLoginScreenAnotherButtonToLoginKey)),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetsKeys.orDividerWidgetKey)),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetsKeys.kLoginScreenLoginButton)),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetsKeys.kLoginScreenTextRichKey)),
      findsOneWidget,
    );
  });
}
