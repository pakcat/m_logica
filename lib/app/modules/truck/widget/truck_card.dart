import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';

class CardTruck extends StatelessWidget {
  const CardTruck({
    super.key,
    this.isRegistered = false,
  });

  final bool isRegistered;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.neutral40, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: isRegistered
                      ? AppColors.successMain
                      : AppColors.neutral70,
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.only(right: 6),
              width: Get.width,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "SI10218291",
                      style: Ts.text.regularTextLarge18xRegular.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.neutral90),
                    )),
                    isRegistered
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.successSurface),
                            child: Text(
                              "Registered",
                              style: Ts.text.xSmallTextBase12pxRegular
                                  .withColor(AppColors.successMain),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.neutral40),
                            child: Text(
                              "Unregistered",
                              style: Ts.text.xSmallTextBase12pxRegular
                                  .withColor(AppColors.neutral70),
                            ),
                          )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      "BALARAJA",
                      style: Ts.text.regularTextSmall14pxRegular
                          .withColor(AppColors.neutral70),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(AppAssets.arrow),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "HPM ABEFURA",
                      style: Ts.text.regularTextSmall14pxRegular
                          .withColor(AppColors.neutral70),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
