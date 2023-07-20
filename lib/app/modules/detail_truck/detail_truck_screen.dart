import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';
import 'package:m_logica/app/core/widget/app_bar.dart';
import 'package:m_logica/app/core/widget/app_button.dart';
import 'package:m_logica/app/core/widget/app_textfield.dart';
import 'package:m_logica/app/modules/detail_truck/detail_truck_controller.dart';
import 'package:m_logica/app/modules/detail_truck/widget/save_bottom_sheet.dart';

class DetailTruckScreen extends GetView<DetailTruckController> {
  const DetailTruckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral20,
      body: const SafeArea(
          child: Column(
        children: [
          AppBarPrimary(
            text: "Truck Detail",
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              children: [
                InformationTruck(
                  isRegistered: true,
                ),
                SizedBox(
                  height: 16,
                ),
                FormTruck()
              ],
            ),
          ))
        ],
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: const Color(0xff000000).withOpacity(0.05),
              offset: const Offset(0, -6))
        ]),
        padding: const EdgeInsets.all(16),
        child: AppButton(
          text: "Save",
          onTap: () async {
            Get.bottomSheet(
              const SaveBottomSheet(),
              backgroundColor: Colors.white,
              isScrollControlled: true,
            );
          },
        ),
      ),
    );
  }
}

class FormTruck extends StatelessWidget {
  const FormTruck({
    super.key,
    this.isRegistered = false,
  });
  final bool isRegistered;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2))
      ], color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          isRegistered
              ? Container()
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.infoSurface,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.info),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Please Input Field at Below to Register Truck",
                            style: Ts.text.xSmallTextBase12pxRegular
                                .withColor(AppColors.infoMain),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
          const AppTextField(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            label: "Driver Name",
            hintText: "Enter driver name",
          ),
          const SizedBox(
            height: 20,
          ),
          const AppTextField(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            label: "Container No.",
            hintText: "Enter Container No.",
          ),
          const SizedBox(
            height: 20,
          ),
          const AppTextField(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            label: "Plate No.",
            hintText: "Enter Plate No.",
          )
        ],
      ),
    );
  }
}

class InformationTruck extends StatelessWidget {
  const InformationTruck({
    super.key,
    this.isRegistered = false,
  });
  final bool isRegistered;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2))
      ], color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Job Truck No.",
                        style: Ts.text.xSmallTextBase12pxRegular
                            .withColor(AppColors.neutral70),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.earmark),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "SI102042190490",
                            style: Ts.text.regularTextBase16pxRegular
                                .copyWith(fontWeight: FontWeight.w500)
                                .withColor(AppColors.neutral90),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Badge(
                      textColor: AppColors.white,
                      backgroundColor: AppColors.dangerMain,
                      label: Text("4"),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Days",
                      style: Ts.text.smallTextBase14pxRegular,
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: AppColors.neutral30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Store",
                        style: Ts.text.xSmallTextBase12pxRegular
                            .withColor(AppColors.neutral70),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.buildings),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "BALARAJA",
                                style: Ts.text.regularTextBase16pxRegular
                                    .copyWith(fontWeight: FontWeight.w500)
                                    .withColor(AppColors.neutral90),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: SvgPicture.asset(AppAssets.arrowbg),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(AppAssets.buildings),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    "HPM PANAKUNANG",
                                    style: Ts.text.regularTextBase16pxRegular
                                        .copyWith(fontWeight: FontWeight.w500)
                                        .withColor(AppColors.neutral90),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.neutral30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: Ts.text.xSmallTextBase12pxRegular
                            .withColor(AppColors.neutral70),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isRegistered
                                ? AppColors.successSurface
                                : AppColors.neutral40),
                        child: Text(
                          isRegistered ? 'Registered' : "Unregistered",
                          style: Ts.text.regularTextBase16pxRegular.withColor(
                              isRegistered
                                  ? AppColors.successMain
                                  : AppColors.neutral70),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
