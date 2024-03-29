import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stoxhero/firebase_options.dart';
import 'src/app/app.dart';

const bool isProd = false;
const bool useTestToken = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'finowledge',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(App());
}
