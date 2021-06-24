import 'package:shared_preferences/shared_preferences.dart';

Future<void>  getStringValuesSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
}


Future <String> getSavedValue(String key) async {
  String data;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String jsonString = await prefs.getString(key)??'';
  data = jsonString;
  if (jsonString!="") {
    return data;
  }
  return "{}";
}