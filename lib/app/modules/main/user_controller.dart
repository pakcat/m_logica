import 'dart:convert';

import 'package:get/get.dart';
import 'package:m_logica/app/data/remote/response/user.dart';
import 'package:m_logica/app/services/local/user_pref.dart';

class UserController extends GetxController {
  static UserController get to => Get.isRegistered<UserController>()
      ? Get.find()
      : Get.put(UserController());
  User? user;
  UserPref userPref = UserPref();
  @override
  void onInit() {
    setUserData();
    super.onInit();
  }

  saveEmail(String email) {
    userPref.setString("email", email);
  }

  Future<String?> getEmail() async {
    return await userPref.getString("email");
  }

  Future<void> setUserLogIn(User? res) async {
    final jsonData = jsonEncode(res);

    await userPref.setDataPref(jsonData);
  }

  Future<void> setUserData() async {
    final result = await userPref.getDataPref();

    if (result != null) {
      final data = jsonDecode(result);

      user = User.fromJson(data);
    }
  }
}
