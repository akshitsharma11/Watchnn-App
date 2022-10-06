import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchn/core/constant/local_key.dart';
import 'package:watchn/model/auth_model/login_model.dart';

class MyHydratedStorage {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  write(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  getUser() async {
    try {
      LoginModel? user;
      var data = await MyHydratedStorage().read(
        LocalStorageKeys.userAuthentication,
      );
      if (data != null) {
        print('Readable dta is ${data}');
        user = loginModelFromJson(data);
      } else {
        user = null;
      }
      return user;
    } catch (e) {
      print(e);
    }
  }
}
