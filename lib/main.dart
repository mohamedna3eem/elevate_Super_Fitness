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
import 'core/constants/app_theme.dart';
import 'core/di/di.dart';
import 'core/router/app_router.dart';
import 'core/router/route_names.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  final objectBoxService = getIt<ObjectBoxService>();
  await objectBoxService.init();
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(builder: (context) => const MyApp(), enabled: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          initialRoute: RouteNames.mainHome,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          locale: const Locale("en"),
        );
      },
    );
  }
}
