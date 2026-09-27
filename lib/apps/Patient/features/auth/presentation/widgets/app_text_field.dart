import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/apps/Patient/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

enum AppTextFieldType { text, email, password, phone, search, multiline }

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.type = AppTextFieldType.text,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
        this.border,

  });

  final String hintText;
  final AppTextFieldType type;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
    final InputBorder? border;


  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.type == AppTextFieldType.password;
    final isMultiline = widget.type == AppTextFieldType.multiline;
    final isSearch = widget.type == AppTextFieldType.search;

     return TextFormField(
  controller: widget.controller,
  validator: widget.validator,
  readOnly: widget.readOnly,
  onTap: widget.onTap,
  onChanged: widget.onChanged,
  onFieldSubmitted: widget.onSubmitted,
  obscureText: isPassword ? _obscurePassword : false,
  keyboardType: _getKeyboardType(),
  textInputAction: widget.textInputAction ??
      (isMultiline
          ? TextInputAction.newline
          : isSearch
              ? TextInputAction.search
              : TextInputAction.next),
  maxLines: isMultiline ? 4 : 1,
  minLines: isMultiline ? 3 : 1,
  style: context.light16textSub,
  decoration: InputDecoration(
    hintText: widget.hintText,
    hintStyle: context.light16textSub,
    prefixIcon: widget.prefixIcon,

    filled: true,
    fillColor: AppColors.white,

    contentPadding: EdgeInsets.symmetric(
      horizontal: context.w(15),
      vertical: context.h(16),
    ),

    border: widget.border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            context.r(isSearch ? 30 : 12),
          ),
          borderSide: BorderSide.none,
        ),

    enabledBorder: widget.border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            context.r(isSearch ? 30 : 12),
          ),
          borderSide: BorderSide.none,
        ),

    focusedBorder: widget.border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            context.r(isSearch ? 30 : 12),
          ),
          borderSide: BorderSide.none,
        ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        context.r(12),
      ),
      borderSide: const BorderSide(
        color: AppColors.danger,
      ),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        context.r(12),
      ),
      borderSide: const BorderSide(
        color: AppColors.danger,
      ),
    ),

    errorStyle: const TextStyle(
      height: 1.2,
    ),

    suffixIcon: isPassword
        ? IconButton(
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppColors.textSub,
            ),
          )
        : widget.suffixIcon,
  ),
);
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case AppTextFieldType.email:
        return TextInputType.emailAddress;
      case AppTextFieldType.phone:
        return TextInputType.phone;
      case AppTextFieldType.multiline:
        return TextInputType.multiline;
      case AppTextFieldType.password:
        return TextInputType.visiblePassword;
      case AppTextFieldType.search:
      case AppTextFieldType.text:
        return TextInputType.text;
    }
  }
}
