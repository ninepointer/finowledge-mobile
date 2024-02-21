import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:stoxhero/src/app/app.dart';
import 'package:stoxhero/src/base/screen_utils/flutter_screenutil.dart';

import '../core/utils/app_lottie.dart';
import '../env/environment.dart';

import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:get/get.dart' hide MultipartFile;

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
      color: Get.isDarkMode ? AppColors.white : AppColors.black,
      // Change the text color as needed
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
          color: Get.isDarkMode
              ? AppColors.white
              : AppColors.black, // Change the text color as needed
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

String getMediaTypeFromFile(File file) {
  final fileExtension = file.path.split('.').last;
  final mediaType = lookupMimeType(fileExtension);
  print(mediaType);
  return mediaType ?? 'image/$fileExtension';
}

Future<MultipartFile?> convertPlatformFileToMultipartFile(
    PlatformFile? platformFile) async {
  if (platformFile?.path == null) {
    return null;
  } else {
    final file = File(platformFile?.path ?? '');
    return await MultipartFile(
      filename: file.path,
      MediaType.parse(getMediaTypeFromFile(file)),
    );
  }
}
