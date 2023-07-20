import 'package:flutter/material.dart';
import 'package:m_logica/app/core/values/app_assets.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 32,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
            baseColor: AppColors.neutral30,
            highlightColor: const Color(0xffc4c4c4).withOpacity(0.2),
            child: Image.asset(AppAssets.shimmer));
      },
    );
  }
}
