import 'package:shared_preferences/shared_preferences.dart';

  const String _patientList='patientList';
  Future setPatientList(List<String> list)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_patientList, list);
  } 

Future<void>  setStringValuesSF(String key, String value) async {
    print('Value of Key $value');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
}

Future<void> getboolValueSafe(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
}
Future <bool> getSavedBoolValue(String key) async {
  bool data;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool jsonBool = await prefs.getBool(key)??false;
  
    return jsonBool;
}
Future <String> getSavedValue(String key) async {
  String data;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final String jsonString = await prefs.getString(key)??'';
  // data = jsonString;
  // if (jsonString!="") {
    print(prefs.getString(key)??'');
    return prefs.getString(key)??'';
  // }
  // return "{}";
}