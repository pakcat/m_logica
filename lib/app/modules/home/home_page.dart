import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/modules/home/home_controller.dart';
import 'package:m_logica/app/modules/home/widget/event_card.dart';
import 'package:m_logica/app/modules/main/user_controller.dart';
import 'package:m_logica/app/routes/app_routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 200 + MediaQuery.of(context).padding.top,
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
              transform: GradientRotation(2.32), // Equivalent to 232 degrees
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  16, MediaQuery.of(context).padding.top + 25, 16, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hello, ",
                                style: Ts.text.xSmallTextBase12pxRegular
                                    .withColor(AppColors.white),
                              ),
                              GetBuilder<UserController>(builder: (_) {
                                return Text(
                                  _.user?.firstName ?? "",
                                  style: Ts.text.boldTextBase16pxBold
                                      .withColor(AppColors.white),
                                );
                              })
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.white)),
                            child: Text("MPPA",
                                style: Ts.text.boldTextSmall14pxBold
                                    .withColor(AppColors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 6),
                              blurRadius: 18,
                              color: const Color(0xff2A6BCE).withOpacity(0.12))
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          child: Bounce(
                            onPressed: () {
                              Get.toNamed(AppRoutes.truck);
                            },
                            duration: const Duration(milliseconds: 120),
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(12),
                                    height: 85,
                                    width: 85,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffE3EEFF),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: SvgPicture.asset(AppAssets.truck)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Truck",
                                  style: Ts.text.regularTextSmall14pxRegular,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Bounce(
                            onPressed: () {
                              Get.toNamed(AppRoutes.event);
                            },
                            duration: const Duration(milliseconds: 120),
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(12),
                                    height: 85,
                                    width: 85,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffE3EEFF),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: SvgPicture.asset(AppAssets.event)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Event",
                                  style: Ts.text.regularTextSmall14pxRegular,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Bounce(
                            onPressed: () {
                              Get.toNamed(AppRoutes.history);
                            },
                            duration: const Duration(milliseconds: 120),
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(12),
                                    height: 85,
                                    width: 85,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffE3EEFF),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: SvgPicture.asset(AppAssets.history)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "History",
                                  style: Ts.text.regularTextSmall14pxRegular,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 26, 16, 10),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.calendar),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Today Events",
                    style: Ts.text.semiBoldTextSmall14pxBold,
                  ),
                  const SizedBox(
                    width: 12,
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
                    style: Ts.text.regularTextSmall14pxRegular
                        .withColor(AppColors.neutral70),
                  ),
                  const Spacer(),
                  Text("See More",
                      style: Ts.text.xSmallTextBase12pxRegular
                          .withColor(const Color(0xFF5583CA))),
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(AppAssets.rightArrow)
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<HomeController>(builder: (homeController) {
                return ListView.separated(
                  itemCount: homeController.listSi.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shrinkWrap: true,
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
                );
              }),
            ),
          ],
        )
      ],
    ));
  }
}
