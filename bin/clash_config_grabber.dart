import 'package:clash_config_grabber/clash_config_grabber.dart' as clash_config_grabber;
import 'package:clash_config_grabber/features/data/getter/data_getter.dart';
import 'package:clash_config_grabber/features/data/parser/data_parser.dart';
import 'package:clash_config_grabber/generated_env.dart';
import 'package:hemend_toolkit/core/io/command_line_toolkit/command_line_tools.dart';

void main(List<String> arguments) async {
  for (final url in (await cli.runAsyncOn('getting data', () => download()))) {
    print('${$Environments.CONFIG_APP_API_BASE}${$Environments.CONFIG_APP_API_PROXY_PATH}/$url');
  }
}

Future<List<String>> download() async {
  final xml = await DataGetter.downloadXmlFile();
  return await DataParser.parse(xml);
}
