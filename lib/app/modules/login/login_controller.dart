import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/base/base_controller.dart';
import 'package:m_logica/app/data/remote/response/user.dart';
import 'package:m_logica/app/modules/main/user_controller.dart';
import 'package:m_logica/app/repositories/auth_repo.dart';
import 'package:m_logica/app/routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();

  @override
  void onInit() async {
    emailC.text = await UserController.to.getEmail() ?? "";
    super.onInit();
  }

  Future login() async {
    AuthRepo authRepo = AuthRepo();
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      final User? user = await authRepo.login(
        username: emailC.text,
      );

      if (user != null) {
        UserController.to.saveEmail(emailC.text);
        UserController.to.setUserLogIn(user);
        Get.offAllNamed(AppRoutes.main);
        BaseController.initMain();
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: e.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
