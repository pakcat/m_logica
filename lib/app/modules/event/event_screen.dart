import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/core/widget/app_bar.dart';
import 'package:m_logica/app/core/widget/app_textfield.dart';
import 'package:m_logica/app/modules/event/event_controller.dart';
import 'package:m_logica/app/modules/home/widget/event_card.dart';

class EventScreen extends GetView<EventController> {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const AppBarPrimary(
          text: 'Event',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: AppTextField(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  suffixIcon: SvgPicture.asset(AppAssets.search),
                  hintText: "Enter SI Number",
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff487ECF)),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    SvgPicture.asset(AppAssets.filter),
                    Text(
                      "Filter",
                      style: Ts.text.regularTextSmall14pxRegular
                          .withColor(const Color(0xff487ECF)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.neutral20,
                border: Border(top: BorderSide(color: AppColors.neutral40))),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            "Showing data",
                            style: Ts.text.xSmallTextBase12pxRegular,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Badge(
                            textColor: AppColors.white,
                            backgroundColor: AppColors.dangerMain,
                            label: Text("4"),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Trip",
                            style: Ts.text.xSmallTextBase12pxRegular,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 12,
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    physics: const ScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return CardEvent(
                        status: index < 12 ? index : 0,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    )));
  }
}
