import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/core/widget/app_button.dart';
import 'package:m_logica/app/routes/app_routes.dart';
import 'package:m_logica/app/services/local/user_pref.dart';

class BottomSheetLogOut extends StatelessWidget {
  const BottomSheetLogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28), topRight: Radius.circular(28))),
        padding: const EdgeInsets.all(20),
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff79747E).withOpacity(0.4)),
            ),
            const SizedBox(
              height: 32,
            ),
            Image.asset(
              AppAssets.logoutImage,
              height: 136,
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  style: Ts.text.regularTextBase16pxRegular
                      .withColor(AppColors.neutral90),
                  children: <TextSpan>[
                    const TextSpan(text: "Are you sure to "),
                    TextSpan(
                      text: "Log Out",
                      style: Ts.text.boldTextBase16pxBold,
                    ),
                    const TextSpan(text: " his account")
                  ]),
            ),
            const SizedBox(
              height: 44,
            ),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  onTap: () async {
                    Get.back();
                  },
                  text: 'Cancel',
                  padding: 8,
                  color: AppColors.white,
                  textColor: AppColors.dangerMain,
                  border: Border.all(color: AppColors.dangerMain),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: AppButton(
                  onTap: () async {
                    UserPref userPref = UserPref();
                    await userPref.clearPref();
                    await Get.offAllNamed(AppRoutes.login);
                  },
                  text: 'Yes',
                  padding: 8,
                  color: AppColors.dangerMain,
                  border: Border.all(color: AppColors.dangerMain),
                ))
              ],
            )
          ],
        ));
  }
}
