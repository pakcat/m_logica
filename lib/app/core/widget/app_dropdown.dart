import 'package:flutter/material.dart';
import 'package:m_logica/app/core/values/app_colors.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown(
      {Key? key,
      required this.data,
      this.label,
      this.labels,
      this.border = false,
      this.currentValue,
      required this.onChanged,
      this.hint,
      this.validator,
      this.backgroundColor,
      this.labelGap,
      this.labelColor})
      : super(key: key);
  final List<String> data;
  final List<String>? labels;
  final bool border;
  final String? hint;
  final String? currentValue;
  final String? label;
  final Color? labelColor;
  final Color? backgroundColor;
  final double? labelGap;
  final String? Function(String?)? validator;

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Text(label ?? ''),
        ),
        SizedBox(
          height: labelGap ?? (label != null ? 10 : 0),
        ),
        DropdownButtonFormField<String>(
          validator: validator,
          borderRadius: BorderRadius.circular(6),
          value: currentValue,
          isExpanded: true,
          isDense: true,
          alignment: AlignmentDirectional.center,
          // icon: SvgPicture.asset(
          //   'assets/icons/direction-down.svg',
          //   width: 18,
          // ),
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                hint ?? "",
                textAlign: TextAlign.left,
              )
            ],
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            filled: true,
            fillColor: backgroundColor ?? Colors.transparent,
            // hintStyle: Ts.text.sRegular.withColor(BaseColor.gray03),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.red, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.red, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.primary60)),
          ),
          // style: Ts.text.sRegular,
          onChanged: (String? value) {
            onChanged(value);
          },
          items: [
            for (var i = 0; i < data.length; i++)
              DropdownMenuItem<String>(
                value: data[i],
                child: Text(
                  labels != null ? labels![i] : data[i],
                  // style: Ts.text.sRegular.withColor(BaseColor.blackDark)
                ),
              )
          ],
        ),
      ],
    );
  }
}
