import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Shared/shared.dart';

Future<List> getPatientApi(String type) async {
  @override
  final result = await http.get(Uri.parse('http://10.0.2.2:8080/api/getPatient/' + type),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (result.statusCode == 200) {
    var decodeData = json.decode(result.body);

      List patientData = decodeData['patient'][0];
      return patientData;
  }
  return [];
}
Future<bool> deletePatient(String email) async{
   final result = await http.delete(Uri.parse('http://10.0.2.2:8080/api/deletePatient/'+email),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (result.statusCode == 200) {
    print('Check');
    return true;
  }
  return false;
}