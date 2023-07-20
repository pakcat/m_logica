import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/widget/app_button.dart';
import 'package:m_logica/app/core/widget/app_textfield.dart';
import 'package:m_logica/app/modules/login/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Get.put(LoginController());
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SafeArea(
                child: Stack(
              children: [
                Image.asset(AppAssets.ellipse5),
                Image.asset(AppAssets.ellipse6),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Image.asset(AppAssets.login),
                        const SizedBox(
                          height: 70,
                        ),
                        AppTextField(
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return 'Please enter an email address.';
                            }
                            // Use regex pattern for email validation
                            final emailRegex = RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                            if (!emailRegex.hasMatch(value!)) {
                              return 'Please enter a valid email address.';
                            }
                            return null; // Return null if the input is valid
                          },
                          controller: controller.emailC,
                          label: "Email",
                          hintText: "Enter your email",
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 40,
                    left: 20,
                    right: 20,
                    child: AppButton(
                      text: "Login",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                    ))
              ],
            )),
          ),
        ));
  }
}
