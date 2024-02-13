import '../../main.dart';
import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get baseURL => remoteConfig.getValue('prod_base_url').asString();

  @override
  String get apiUrl => remoteConfig.getValue('prod_api_endpoint').asString();

  @override
  String get apiVersion => remoteConfig.getValue('prod_api_version').asString();

  @override
  String get siteMessages => remoteConfig.getValue('site_messages').asString();
}
