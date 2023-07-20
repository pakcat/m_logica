import 'package:get/get.dart';
import 'package:m_logica/app/modules/home/home_controller.dart';
import 'package:m_logica/app/modules/main/main_controller.dart';
import 'package:m_logica/app/modules/main/user_controller.dart';
import 'package:m_logica/app/modules/profile/profile_controller.dart';

class BaseController {
  static init() {}
  static initMain() {
    Get.put(HomeController());
    Get.put(MainController());
    Get.put(ProfileController());
    Get.put(UserController());
  }
}
