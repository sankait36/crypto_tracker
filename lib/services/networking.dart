import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String url;

  Networking(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
