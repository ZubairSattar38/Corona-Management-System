import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Shared/shared.dart';

Future<List> getNonVaccinatedApi(int id) async {
  final result = await http
      .get(Uri.parse('http://10.0.2.2:8080/api/getPatient/$id'), headers: {
    'Content-Type': 'application/json; charset=UTF-8',
  });
  if (result.statusCode == 200) {
    var decodeData = json.decode(result.body);
    List patientData = decodeData['patient'][0];
    return patientData;
  }
  return [];
}

Future<bool> updatePatienVaccinated(var object) async {
  final result = await http
      .post(Uri.parse('http://10.0.2.2:8080/api/updatePatient'), headers: {
    'Content-Type': 'application/json; charset=UTF-8',
  },body:jsonEncode(object));
  if (result.statusCode == 200) {
    print('Check');
    return true;
  }
      print('false');

  return false;
}

Future<bool> deletePatient(String email) async {
  print(email);
  final result = await http.delete(
      Uri.parse('http://10.0.2.2:8080/api/deletePatient/$email'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (result.statusCode == 200) {
    print('Check');
    return true;
  }
  return false;
}
