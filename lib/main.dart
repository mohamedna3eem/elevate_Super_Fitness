import 'package:device_preview/device_preview.dart';
import 'package:elevate_super_fitness/core/utils/object_box_service.dart';
import 'package:elevate_super_fitness/firebase_options.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/my_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_theme.dart';
import 'core/di/di.dart';
import 'core/provider/app_config.dart';
import 'core/router/app_router.dart';
import 'core/router/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  final objectBoxService = getIt<ObjectBoxService>();
  await objectBoxService.init();
  Bloc.observer = MyBlocObserver();
  final appConfigProvider = AppConfigProvider();
  await appConfigProvider.getLocal();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ChangeNotifierProvider.value(
        value: appConfigProvider,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: AppLocalizations().appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RouteNames.splash,
          locale: provider.locale,
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}

