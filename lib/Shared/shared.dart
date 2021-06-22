import 'package:shared_preferences/shared_preferences.dart';

Future<void>  getStringValuesSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString(key, value);
}


Future <String> getSavedValue(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String jsonString = prefs.getString(key)??"";
  print(jsonString);
  if (jsonString != null && jsonString!="") {
    return jsonString;
  }
  return "{}";
}