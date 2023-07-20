import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/core/widget/app_button.dart';

class SaveBottomSheet extends StatelessWidget {
  const SaveBottomSheet({
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
              AppAssets.save,
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
                      text: "Save",
                      style: Ts.text.boldTextBase16pxBold,
                    ),
                    const TextSpan(text: " this record")
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
                  textColor: AppColors.primary60,
                  border: Border.all(color: AppColors.primary60),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: AppButton(
                  text: 'Yes',
                  padding: 8,
                  color: AppColors.primary60,
                  border: Border.all(color: AppColors.primary60),
                ))
              ],
            )
          ],
        ));
  }
}
