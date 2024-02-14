import 'dart:convert';

import 'package:flutter/services.dart';

import '../env/environment.dart';

String string(String key, [dynamic args])  {
  //return globalContext.getString(key, args);
  String response = Environment().config?.siteMessages ?? "";
  if (response.isNotEmpty) {
    Map mapValue = jsonDecode(response);
    return mapValue[key];
  } else {
    return key;
  }
}

class AssetsLoader{
static Future<String> loadLocalText(String key) async {
  String jsonString = await rootBundle.loadString('assets/text/en.json');
  Map<String, dynamic> jsonData = json.decode(jsonString);
  String textValue = jsonData[key];
  return textValue;
}
}
