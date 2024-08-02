import 'package:edge_pro/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onTap;
  final TextInputType keyboardType;
  final TextInputAction action;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool readOnly;
  final bool autoFocus;
  final bool? filled;
  final Color fillColor;
  final String? keyError;
  final Map<String, dynamic>? errors;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final FocusNode? focusNode;
  final double? radius;
  final double suffixIconMaxWidth;
  final bool isPayment;
  final bool enabled;
  final bool? changeErrorTextHeight;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final AutovalidateMode autovalidateMode;

  const AppTextFormField({
    super.key,
    this.controller,
    required this.keyboardType,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled =true,
    this.action = TextInputAction.next,
    this.isPassword = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.fillColor = Colors.white,
    this.validator,
    this.focusNode,
    this.changeErrorTextHeight =false,
    this.onChanged,
    this.onSaved,
    this.keyError,
    this.filled,
    this.inputFormatters,
    this.errors,
    this.minLines,
    this.maxLines = 1,
    this.radius,
    this.suffixIconMaxWidth = 35,
    this.isPayment = false,
    this.contentPadding,
    this.onTap,
    this.textAlign,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: action,
      obscureText: isPassword,
      autovalidateMode: autovalidateMode,
      cursorColor: AppColors.text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.text,
        fontSize: 14.sp,
      ),
      readOnly: readOnly,
      autofocus: autoFocus,
      inputFormatters: inputFormatters,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      textAlign: textAlign??TextAlign.start,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        filled: filled ?? false,
        fillColor: fillColor,
        hintStyle: TextStyle(
            color:enabled? AppColors.greyTextColor:Colors.grey.shade400,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: EdgeInsetsDirectional.only(end: 5.w),
          child: suffixIcon,
        ),
        suffixIconConstraints: BoxConstraints(maxWidth: suffixIconMaxWidth),
        errorText: null,
        errorStyle: TextStyle(
            color: Colors.red, fontWeight: FontWeight.w500, fontSize: 12.sp, height:changeErrorTextHeight ==true? .3:null),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
          borderRadius: BorderRadius.circular(radius ?? 7.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(radius ?? 7.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(radius ?? 7.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          borderRadius: BorderRadius.circular(radius ?? 7.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          borderRadius: BorderRadius.circular(radius ?? 7.r),
        ),
      ),
    );
  }
}
