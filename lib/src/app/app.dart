import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stoxhero/src/base/screen_utils/flutter_screenutil.dart';
// import 'package:stoxhero/src/data/models/response/site_settings_response.dart';
import 'package:stoxhero/src/env/environment.dart';

import '../../main.dart';
import 'app.dart';
import 'app_binding.dart';
export 'app_controller.dart';

export '../app/app.dart';
export '../base/base.dart';
export '../core/core.dart';
export '../data/data.dart';
export '../modules/modules.dart';

export 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  /// We use WidgetsBindingObserver to notify the UI change in the device metrics (Media Query).

  @override
  void initState() {
    super.initState();
    _initializePushNotification();
    //AppStorage.setSiteSettings(siteSettingsResponseFromJson(Environment().config?.siteSettings ?? ""));
    WidgetsBinding.instance.addObserver(this);
  }

  Future _initializePushNotification() async {
    await NotificationServices.initializeNotificationService(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );
    return ScreenUtilInit(
      designSize: Size(446, 960),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        title: AppConstants.appName,
        themeMode: ThemeService().theme,
        theme: AppTheme.lightThemeData(context),
        darkTheme: AppTheme.darkThemeData(context),
        initialBinding: AppBinding(),
        getPages: AppPages.pages,
        initialRoute: AppRoutes.splash,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
    firebaseConfig.appState = state;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
