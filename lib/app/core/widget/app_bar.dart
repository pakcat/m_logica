import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';

import '../values/app_assets.dart';

class AppBarPrimary extends StatelessWidget {
  const AppBarPrimary({
    super.key,
    this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6EC4DF), Color(0xFF2160BE)],
          stops: [0.0, 1.0],

          transform: GradientRotation(2.32), // Equivalent to 232 degrees
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Bounce(
                      duration: const Duration(milliseconds: 120),
                      onPressed: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(AppAssets.leftArrow)),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    text ?? "",
                    style: Ts.text.regularTextLarge18xRegular
                        .withColor(AppColors.white),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            AppAssets.meratus,
            height: 58,
          )
        ],
      ),
    );
  }
}
