import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/modules/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Image.asset(
          AppAssets.splash,
          width: Get.width,
          height: Get.height,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'mLogica v1.20.1',
              style: Ts.text.regularTextBase16pxRegular
                  .withColor(AppColors.primary60),
            ),
          ),
        )
      ],
    )));
  }
}
