import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> addDoze(var object) async {
  @override
  final result = await http.post(Uri.parse('http://10.0.2.2:8080/api/AddDoze'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(object));
  if (result.statusCode == 200) {
      return Future.value(true);
  } else {
    return Future.value(false);
  }
}
Future<List> getDoze() async {
  final result = await http
      .get(Uri.parse('http://10.0.2.2:8080/api/getDozeRecord'), headers: {
    'Content-Type': 'application/json; charset=UTF-8',
  });
  print(result.body);
  if (result.statusCode == 200) {
    var decodeData = json.decode(result.body);
    List patientData = decodeData['records'][0];
    return patientData;
  }
  return [];
}
Future<bool> deleteDoze(String email) async {
  print(email);
  final result = await http.delete(
      Uri.parse('http://10.0.2.2:8080/api/deleteDoze/$email'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (result.statusCode == 200) {
    print('Check');
    return true;
  }
  return false;
}

