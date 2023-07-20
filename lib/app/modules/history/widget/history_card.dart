import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.neutral40, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
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
