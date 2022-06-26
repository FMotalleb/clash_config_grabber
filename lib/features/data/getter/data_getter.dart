import 'package:http/http.dart' as http;

import '../../../generated_env.dart';

abstract class DataGetter {
  static const requestUrl = $Environments.CONFIG_APP_API_BASE + $Environments.CONFIG_APP_API_PROXY_PATH;
  static Future<String> getLatestConfig() async {
    return 'mamad';
  }

  static Future<String> downloadXmlFile() async {
    final response = await http.get(Uri.parse(requestUrl));
    return response.body;
  }
}
