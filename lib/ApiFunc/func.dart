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
    var decodeData = json.decode(result.body);
    if (decodeData['name'].toString() != '') {
      setStringValuesSF('name', decodeData['name'].toString());
    }
    if (decodeData['token'].toString() != '') {
      setStringValuesSF('token', decodeData['token'].toString());
    }
    if (decodeData['email'].toString() != '') {
      setStringValuesSF('email', decodeData['email'].toString());
    }
    if (decodeData['roll'].toString() != '') {
      print(decodeData['roll'].toString());
      setStringValuesSF('roll', decodeData['roll'].toString());
    }
    getboolValueSafe('isToken', decodeData['isToken'] ?? false);
    if (decodeData['isToken'] == true) {
      return Future.value(true);
    }
  }
  return Future.value(false);
}
