import 'package:flutter/services.dart';

class JsonUtils {
  late String data;

  Future<String> read() async {
    data = await rootBundle.loadString('assets/teste.json');
    return data;
  }
}
