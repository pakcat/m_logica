import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';

class CardEvent extends StatefulWidget {
  const CardEvent({
    super.key,
    this.status = 0,
  });

  final int? status;

  @override
  State<CardEvent> createState() => _CardEventState();
}

class _CardEventState extends State<CardEvent> {
  //backgroundbadge
  //textcolor
  //cardborder

  Map<int, List<dynamic>> colorMain = {
    0: [
      'Truck Register',
      AppColors.warningMain,
      AppColors.warningSurface,
      const Color(0xffF09A28).withOpacity(0.6)
    ],
    1: [
      'Start Loading',
      AppColors.infoMain,
      AppColors.infoSurface,
      const Color(0xff2866C5).withOpacity(0.7)
    ],
    2: [
      'On Hold',
      AppColors.secondaryMain,
      AppColors.secondarySurface,
      AppColors.secondaryMain,
    ],
    3: [
      'Finish Loading',
      AppColors.successMain,
      AppColors.successSurface,
      const Color(0xff1CAE70).withOpacity(0.5),
    ],
    4: [
      'End Loading',
      AppColors.white,
      AppColors.successMain,
      const Color(0xff1CAE70)
    ],
    5: [
      'Receive BAST',
      AppColors.neutral90,
      AppColors.neutral40,
      const Color(0xff878787)
    ],
    6: [
      'Arrived in Port Origin',
      AppColors.white,
      AppColors.primary70,
      AppColors.blue
    ],
    7: [
      'Arrived at DEPO',
      AppColors.white,
      AppColors.warningMain,
      AppColors.warningMain
    ],
    8: [
      'Vessel Departed',
      AppColors.white,
      AppColors.primaryMain,
      AppColors.primaryMain
    ],
    9: [
      'Vessel Departed',
      AppColors.white,
      const Color(0xff1E6748),
      const Color(0xff1E6748),
    ],
    10: [
      'Discharge at POD',
      AppColors.white,
      AppColors.secondaryHovered,
      AppColors.secondaryHovered,
    ],
    11: [
      'Dooring to Cust',
      AppColors.white,
      AppColors.primary50,
      AppColors.primary50,
    ],
  };

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
                  color: colorMain[widget.status]![3],
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorMain[widget.status]![2]),
                      child: Text(
                        colorMain[widget.status]![0],
                        style: Ts.text.xSmallTextBase12pxRegular
                            .withColor(colorMain[widget.status]![1]),
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
