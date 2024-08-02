import 'package:dot/shared/extensions/styles_extension.dart';
import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppTextInput({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      style: AppTypography.bodyText2.copyWith(color: AppColor.grey[1]),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: colors.background,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 55,
          minHeight: 25,
        ),
        hintStyle: AppTypography.bodyText2.copyWith(color: AppColor.grey[3]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.grey[5]!,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.grey[5]!,),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.grey[5]!,),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.error,),
        )
      ),
    );
  }
}
