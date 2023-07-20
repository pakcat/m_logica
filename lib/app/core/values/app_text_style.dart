import 'package:flutter/material.dart';
import 'package:m_logica/app/core/values/app_colors.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}

class Ts {
  static TxtStyle text = TxtStyle();
  static HeadStyle heading = HeadStyle();
}

class TxtStyle {
  // S
  //styleName: Regular Text/Base - 16px Regular;
  final TextStyle xSmallTextBase12pxRegular = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral90,
    fontSize: 12,
  );
  final TextStyle smallTextBase14pxRegular = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral90,
    fontSize: 14,
  );
  final TextStyle regularTextBase16pxRegular = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral90,
    fontSize: 16,
  );
  final TextStyle regularTextSmall14pxRegular = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral90,
    fontSize: 14,
  );

  final TextStyle boldTextBase16pxBold = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: AppColors.neutral90,
    fontSize: 16,
  );
  final TextStyle boldTextSmall14pxBold = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: AppColors.neutral90,
    fontSize: 14,
  );
  final TextStyle semiBoldTextSmall14pxBold = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    color: AppColors.neutral90,
    fontSize: 14,
  );
  final TextStyle regularTextLarge18xRegular = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.neutral90,
    fontSize: 18,
  );
  final TextStyle boldTextLead24pxBold = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: AppColors.neutral90,
    fontSize: 24,
  );
}

class HeadStyle {
  // S
}
