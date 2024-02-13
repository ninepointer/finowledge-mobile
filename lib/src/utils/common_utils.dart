import 'dart:convert';

import '../env/environment.dart';

String string(String key, [dynamic args]) {
  //return globalContext.getString(key, args);
  String response = Environment().config?.siteMessages ?? "";
  if (response.isNotEmpty) {
    Map mapValue = jsonDecode(response);
    return mapValue[key];
  } else {
    return key;
  }
}
