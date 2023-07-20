import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/modules/main/user_controller.dart';
import 'package:m_logica/app/modules/profile/profile_controller.dart';
import 'package:m_logica/app/modules/profile/widget/logout_bottom_sheet.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return Scaffold(
          body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 140 + MediaQuery.of(context).padding.top,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                image: DecorationImage(
                    image: AssetImage(AppAssets.bgHome), fit: BoxFit.cover),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF6EC4DF), Color(0xFF2160BE)],
                  stops: [0.0, 1.0],

                  transform:
                      GradientRotation(2.32), // Equivalent to 232 degrees
                ),
              ),
              child: Image.asset(
                AppAssets.bgProfile,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 110,
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(top: 20),
                    clipBehavior: Clip.hardEdge,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white, width: 1),
                        color: const Color(0xffE0E0E0),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      AppAssets.profile,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    " ${userController.user?.firstName} ${userController.user?.lastName}",
                    style: Ts.text.boldTextBase16pxBold.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    userController.user?.email ?? "",
                    style: Ts.text.regularTextSmall14pxRegular
                        .withColor(AppColors.neutral70),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                        color: AppColors.primary60,
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      "MPPA",
                      style: Ts.text.regularTextSmall14pxRegular
                          .withColor(AppColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Bounce(
                    onPressed: () {
                      Get.bottomSheet(
                        const BottomSheetLogOut(),
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                      );
                    },
                    duration: const Duration(milliseconds: 120),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: AppColors.neutral30, width: 1)),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.logout),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Log Out",
                            style: Ts.text.regularTextBase16pxRegular
                                .withColor(AppColors.dangerMain),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 23),
                    child: Text(
                      "mLogica v1.20.1",
                      style: Ts.text.xSmallTextBase12pxRegular
                          .withColor(AppColors.neutral60),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
    });
  }
}
