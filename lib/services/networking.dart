import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String url;
  final String key;

  Networking(this.url, this.key);

  Future<dynamic> getData() async {
    http.Response response = await http.get(
      url, 
      headers: {'x-ba-key': key},
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
