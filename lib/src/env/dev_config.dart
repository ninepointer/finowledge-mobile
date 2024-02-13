import '../../main.dart';
import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get baseURL => remoteConfig.getValue('dev_base_url').asString();

  @override
  String get apiUrl => remoteConfig.getValue('dev_api_endpoint').asString();

  @override
  String get apiVersion => remoteConfig.getValue('dev_api_version').asString();

  @override
  String get siteMessages => remoteConfig.getValue('site_messages').asString();
}
