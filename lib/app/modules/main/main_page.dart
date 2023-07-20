import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/modules/main/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return Scaffold(
          body: controller.pages[controller.indexPage],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: const Color(0xff000000).withOpacity(0.06),
                  offset: const Offset(0, -4))
            ]),
            child: Row(
              children: [
                Expanded(
                  child: Bounce(
                    onPressed: () {
                      controller.changePage(0);
                    },
                    duration: const Duration(milliseconds: 120),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: controller.indexPage == 0
                            ? LinearGradient(
                                stops: const [0, 1],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xff2843AF).withOpacity(0.06),
                                  const Color(0xff2843AF).withOpacity(0.06),
                                ])
                            : null,
                        border: Border(
                            top: BorderSide(
                                color: controller.indexPage == 0
                                    ? AppColors.primary60
                                    : Colors.transparent,
                                width: 4)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.home,
                            colorFilter: ColorFilter.mode(
                                controller.indexPage == 0
                                    ? AppColors.primary60
                                    : AppColors.neutral50,
                                BlendMode.srcIn),
                          ),
                          Text(
                            "Home",
                            style: Ts.text.xSmallTextBase12pxRegular.withColor(
                                controller.indexPage == 0
                                    ? AppColors.primary60
                                    : AppColors.neutral50),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Bounce(
                    onPressed: () {
                      controller.changePage(1);
                    },
                    duration: const Duration(milliseconds: 120),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: controller.indexPage == 1
                            ? LinearGradient(
                                stops: const [0, 1],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xff2843AF).withOpacity(0.06),
                                  const Color(0xff2843AF).withOpacity(0.06),
                                ])
                            : null,
                        border: Border(
                            top: BorderSide(
                                color: controller.indexPage == 1
                                    ? AppColors.primary60
                                    : Colors.transparent,
                                width: 4)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.profile,
                            colorFilter: ColorFilter.mode(
                                controller.indexPage == 1
                                    ? AppColors.primary60
                                    : AppColors.neutral50,
                                BlendMode.srcIn),
                          ),
                          Text(
                            "Profile",
                            style: Ts.text.xSmallTextBase12pxRegular.withColor(
                                controller.indexPage == 1
                                    ? AppColors.primary60
                                    : AppColors.neutral50),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
