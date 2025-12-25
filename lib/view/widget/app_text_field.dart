import 'package:clipcuts/resources/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'comman.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final TextStyle? hintStyle;
  final void Function()? suffixOnTap;

  // final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Color fillColor;
  final TextInputType keyboardType;
  final String? errorText;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hint,
    this.suffixOnTap,
    this.obscureText = false,
    this.fillColor = lightGray,
    this.validator,
    this.onChanged,
    this.errorText,
    this.hintStyle,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.maxLength,
    this.focusNode,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          readOnly: !enabled,
          focusNode: focusNode,
          style: textStyle(fontSize: 14),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          onTap: onTap,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          decoration: InputDecoration(
            border: InputBorder.none,
            errorText: errorText,
            counterText: "",
            errorMaxLines: 2,
            filled: true,
            fillColor: focusNode?.hasFocus == false ? fillColor : primaryColor.withOpacity(0.1),
            hintText: hint,
            contentPadding: const EdgeInsets.fromLTRB(14, 15, 22, 15).r,
            hintStyle:
                hintStyle ?? textStyle(fontSize: 14, color: greyColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14).r,
              borderSide: BorderSide(color: lightGrayColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14).r,
              borderSide: BorderSide(color: primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14).r,
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14).r,
              borderSide: BorderSide(color: primaryColor),
            ),
            errorStyle: textStyle(color: Colors.red, fontSize: 13),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                      top: 10,
                      bottom: 10,
                      left: 12,
                    ).r,
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? InkWell(
                    onTap: suffixOnTap,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12).r,
                      child: suffixIcon,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
