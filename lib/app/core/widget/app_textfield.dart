import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.labelSize,
      this.labelGap,
      this.label,
      this.inputFormatters,
      this.prefixIcon,
      this.backgroundColor,
      this.borderColor,
      this.labelColor,
      this.suffixIcon,
      this.focusNode,
      this.onSubmitted,
      this.keyboardType,
      this.textInputAction,
      this.border = false,
      this.obscureText = false,
      this.enabled = true,
      this.padding,
      this.validator,
      this.minLines,
      this.radius})
      : super(key: key);
  final String? label;
  final String? hintText;
  final double? labelSize;
  final TextInputAction? textInputAction;
  final double? labelGap;
  final Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? labelColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool border;
  final bool obscureText;
  final bool enabled;
  final double? radius;
  final String? Function(String?)? validator;
  final EdgeInsets? padding;
  final int? minLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: label != null,
          child: Text(
            label ?? '',
            style: Ts.text.xSmallTextBase12pxRegular
                .withColor(AppColors.neutral90),
          ),
        ),
        SizedBox(
          height: labelGap ?? (label != null ? 4 : 0),
        ),
        TextFormField(
          maxLines: minLines ?? 1,
          minLines: minLines ?? 1,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onFieldSubmitted: onSubmitted,
          focusNode: focusNode,
          enabled: enabled,
          style: Ts.text.regularTextBase16pxRegular,
          cursorColor: AppColors.primary60,
          inputFormatters: inputFormatters,
          obscuringCharacter: '\u25CF',
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 5, top: 5, bottom: 5),
                    margin: const EdgeInsets.only(right: 5),
                    constraints: const BoxConstraints(minWidth: 30),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Container(
                    padding: const EdgeInsets.only(
                        left: 5, right: 15, top: 5, bottom: 5),
                    margin: const EdgeInsets.only(left: 5),
                    constraints: const BoxConstraints(minWidth: 30),
                    child: suffixIcon,
                  )
                : null,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 30, maxHeight: 30),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 30, maxHeight: 30),
            hintText: hintText,
            contentPadding: padding ??
                const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            isDense: true,
            filled: true,
            hintStyle:
                Ts.text.smallTextBase14pxRegular.withColor(AppColors.neutral50),
            fillColor: backgroundColor ?? Colors.transparent,
            errorStyle: Ts.text.xSmallTextBase12pxRegular
                .withColor(AppColors.dangerMain),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 6),
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.dangerMain, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 6),
                borderSide:
                    const BorderSide(color: AppColors.dangerMain, width: 1)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 6),
                borderSide: const BorderSide(color: AppColors.neutral50)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 6),
                borderSide:
                    BorderSide(color: borderColor ?? AppColors.neutral50)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 6),
                borderSide:
                    BorderSide(color: borderColor ?? AppColors.primary60)),
          ),
        ),
      ],
    );
  }
}
