import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Shared/shared.dart';

Future<bool> authPost(var object, String type) async {
  @override
  final result = await http.post(Uri.parse('http://10.0.2.2:8080/api/' + type),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(object));
  if (result.statusCode == 200) {
    String data = result.body;
        print(data);
    var decodeData = jsonDecode(data);
    getStringValuesSF('token', decodeData['token']);
    getStringValuesSF('email', decodeData['email']);
    getStringValuesSF('roll', decodeData['roll']);

    return Future.value(true);
  }else{
    return Future.value(false);
  }
}
