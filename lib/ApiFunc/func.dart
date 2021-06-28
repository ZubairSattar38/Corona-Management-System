import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Shared/shared.dart';

Future<bool> authPost(var object, String type) async {
  @override
  final result = await http.post(Uri.parse('http://10.0.2.2:8080/api/'+type),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(object));
      print(result.body);
  if (result.statusCode == 200) {
    var decodeData = json.decode(result.body);
    if (decodeData['token'].toString()!='') {
      getStringValuesSF('token', decodeData['token'].toString());
   }
    if (decodeData['email'].toString() !='') {
      getStringValuesSF('email', decodeData['email'].toString());
    }
    if (decodeData['roll'].toString()!='') {
      print(decodeData['roll'].toString());
      getStringValuesSF('roll', decodeData['roll'].toString());
    }
    getboolValueSafe('isToken',decodeData['isToken']??false);
    if(decodeData['isToken']==true){
      return Future.value(true);
    }
  } 
    return Future.value(false);
  
}



