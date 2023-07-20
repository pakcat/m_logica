import 'package:get/get.dart';
import 'package:m_logica/app/core/base/base_controller.dart';
import 'package:m_logica/app/modules/main/user_controller.dart';
import 'package:m_logica/app/routes/app_routes.dart';
import 'package:m_logica/app/services/local/user_pref.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkUserSession();
    super.onInit();
  }

  checkUserSession() async {
    UserPref user = UserPref();
    final String? hasToken = await user.getTokenPref();

    if (hasToken != null) {
      2.delay(() async {
        Get.offNamed(AppRoutes.main);

        await BaseController.initMain();
        UserController.to.setUserData();
      });
    } else {
      2.delay(() {
        Get.offNamed(AppRoutes.onBoarding);
      });
    }
  }
}
