import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/core/widget/app_button.dart';
import 'package:m_logica/app/modules/onboarding/onboarding_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:m_logica/app/routes/app_routes.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> onboarding = [
      Image.asset(
        AppAssets.onboarding1,
        width: Get.width,
        fit: BoxFit.fitWidth,
      ),
      Image.asset(
        AppAssets.onboarding2,
        width: Get.width,
        fit: BoxFit.fitWidth,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 80, right: 80, top: 66),
        child: Image.asset(
          AppAssets.onboarding3,
          width: Get.width,
          fit: BoxFit.fitWidth,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
        child: Image.asset(
          AppAssets.onboarding4,
          width: Get.width,
          fit: BoxFit.fitWidth,
        ),
      ),
    ];
    Get.put(OnBoardingController());
    return GetBuilder<OnBoardingController>(builder: (_) {
      return Scaffold(
          body: SafeArea(
              child: Stack(
        children: [
          Image.asset(AppAssets.ellipse5),
          Image.asset(AppAssets.ellipse6),
          CarouselSlider.builder(
            carouselController: controller.buttonCarouselController,
            options: CarouselOptions(
              height: Get.height,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.index = index;
                controller.update();
              },
            ),
            itemCount: onboarding.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  onboarding[itemIndex],
                  Positioned(
                    top: Get.height / 2,
                    child: SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. ",
                              style: Ts.text.boldTextLead24pxBold
                                  .withColor(AppColors.primary60),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Gravida feugiat ultricies maecenas mi. Ipsum et convallis mauris donec turpis. Volutpat aliquet massa ultrices enim.",
                              style: Ts.text.regularTextBase16pxRegular
                                  .withColor(AppColors.neutral70),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Get.height / 5,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: controller.index,
                count: onboarding.length,
                effect: const ExpandingDotsEffect(
                    dotHeight: 6,
                    expansionFactor: 3,
                    dotWidth: 6,
                    dotColor: AppColors.neutral40,
                    activeDotColor: AppColors.primary60),
              ),
            ),
          ),
          controller.index == (onboarding.length - 1)
              ? Positioned(
                  bottom: 20,
                  right: 20,
                  left: 20,
                  child: AppButton(
                    onTap: () async {
                      Get.offNamed(AppRoutes.login);
                    },
                    text: "Get Started",
                  ),
                )
              : Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          Get.offNamed(AppRoutes.login);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          child: Text(
                            "Skip",
                            style: Ts.text.regularTextBase16pxRegular
                                .withColor(AppColors.neutral70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.index < onboarding.length) {
                            controller.index += 1;
                            controller.buttonCarouselController.nextPage();
                            controller.update();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          child: Text(
                            "Next",
                            style: Ts.text.boldTextBase16pxBold
                                .withColor(AppColors.primary60),
                          ),
                        ),
                      )
                    ],
                  )),
        ],
      )));
    });
  }
}
