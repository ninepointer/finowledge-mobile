import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:stoxhero/src/core/utils/package_info_utils.dart';
import 'package:stoxhero/src/env/environment.dart';
import 'package:stoxhero/src/utils/firebase_config.dart';
import 'firebase_options.dart';
import 'src/app/app.dart';

FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
FirebaseConfig firebaseConfig = FirebaseConfig.instance;
AppPackageInfo? appPackageInfo;

const bool isProd = false;
const bool useTestToken = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set Environment
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEV,
  );
  Environment().initConfig(environment);

  /// Firebase
  await Firebase.initializeApp(
    name: 'finowledge',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Make sure minimumFetchInterval make it in hours due to throttle
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));

  /// To Activate and Fetch Remote config data
  await remoteConfig.fetchAndActivate();

  /// App Package
  appPackageInfo = AppPackageInfo();

  await GetStorage.init();
  runApp(App());
}

/// firebase Notification initialize
Future<void> setFirebaseInit() async {
  await firebaseConfig.initializeApp();
  await firebaseConfig.setUp();
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
}
