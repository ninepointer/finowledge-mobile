import 'package:flutter/material.dart';

/// to get main navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// to get all app context
final BuildContext globalContext = navigatorKey.currentState!.context;
