import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:stoxhero/src/base/screen_utils/flutter_screenutil.dart';

import '../core/utils/app_lottie.dart';
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

class AssetsLoader {
  static Future<String> loadLocalText(String key) async {
    String jsonString = await rootBundle.loadString('assets/text/en.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    String textValue = jsonData[key];
    return textValue;
  }
}

Widget emptyOlympiadText(String? txt) {
  return Text(
    txt ?? "",
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors
          .whiteScreenSubHeadingColors, // Change the text color as needed
    ),
    textAlign: TextAlign.center,
  );
}

Widget comingSoonViewWithLottie(String? txt) {
  return Column(
    children: [
      Lottie.asset(AppLottie.comingSoonView, height: 400.h),
      Text(
        txt ?? "",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black, // Change the text color as needed
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

String getBase64FromUint8List(Uint8List bytes) {
  return base64Encode(bytes);
}

Uint8List getUint8List(String path) {
  File file = File(path);
  return file.readAsBytesSync();
}
