import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_logica/app/core/values/app_assets.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.empty);
  }
}
