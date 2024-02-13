import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stoxhero/firebase_options.dart';

class FirebaseConfig {
  static final FirebaseConfig instance = FirebaseConfig._internal();

  NotificationSettings? notificationSettings;

  AppLifecycleState appState = AppLifecycleState.detached;

  FirebaseConfig._internal();

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void delete() {
    FirebaseMessaging.instance.deleteToken();
  }

  Future<void> initializeApp() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<void> setUp() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    Future<String?> getToken() async {
      return await FirebaseMessaging.instance.getToken();
    }
  }
}
