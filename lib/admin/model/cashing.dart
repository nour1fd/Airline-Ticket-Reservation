import 'package:shared_preferences/shared_preferences.dart';

class Cashing{
  static SharedPreferences?sharedPreferencesadmin;
  static init()async{
    sharedPreferencesadmin=await SharedPreferences.getInstance();
  }
  ///ده كود ال set data  فى ال sharedpefrance
  static Future<bool> Savedataadmin({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferencesadmin!.setString(key, value);
    if (value is int) return await sharedPreferencesadmin!.setInt(key, value);
    if (value is bool) return await sharedPreferencesadmin!.setBool(key, value);
    return await sharedPreferencesadmin!.setDouble(key, value);
  }
  ///ده كود ال get data  فى ال sharedpefrance
  static dynamic getDataadmin(String key) {
    return sharedPreferencesadmin!.get(key);
  }
  ///ده كود ال remove data  فى ال sharedpefrance
  static Future<bool> removeDataadmin(String key) async {
    return await sharedPreferencesadmin!.remove(key);
  }}