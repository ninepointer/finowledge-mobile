import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {
  late PackageInfo packageInfo;

  AppPackageInfo() {
    setPackageInfo();
  }

  setPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  /// VersionCode for android and CFBuildVersion for ios
  int getVersionCode() {
    return int.tryParse(packageInfo.buildNumber) ?? 0;
  }

  /// Version name for android and bundleID for ios
  String getVersionName() {
    return packageInfo.version;
  }
}
