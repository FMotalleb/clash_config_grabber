import 'package:xml_parser/xml_parser.dart';

abstract class DataParser {
  static Future<List<String>> parse(String data) async {
    final parsResult = XmlDocument.from(data)!;
    final proxyList = (parsResult.children[1] as XmlElement)
        .children!
        .where((element) => (element as XmlElement).name == 'Contents')
        .map((e) => ((e as XmlElement).children!.firstWhere(
              (element) => (element as XmlElement).name == 'Key',
            )))
        .map((e) => ((e as XmlElement).children!.first as XmlText).value);

    return proxyList.toList();
  }
}
