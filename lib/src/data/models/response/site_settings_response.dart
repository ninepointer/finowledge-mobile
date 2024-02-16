import 'dart:convert';

SiteSettingsData siteSettingsResponseFromJson(String str) =>
    SiteSettingsData.fromJson(json.decode(str));

String siteSettingsResponseToJson(SiteSettingsData data) =>
    json.encode(data.toJson());

class SiteSettingsData {
  SiteSettingsData({
    this.settingList,
  });

  SettingList? settingList;

  factory SiteSettingsData.fromJson(Map<String, dynamic> json) =>
      SiteSettingsData(
        settingList: SettingList.fromJson(json["setting_list"]),
      );

  Map<String, dynamic> toJson() => {
        "setting_list": settingList?.toJson(),
      };
}

class SettingList {
  Map<String, dynamic>? appSettings;

  factory SettingList.fromJson(Map<String, dynamic> json) =>
      SettingList(appSettings: json["app_settings"]);

  Map<String, dynamic> toJson() => {"app_settings": appSettings};

  SettingList({
    this.appSettings,
  });
}
