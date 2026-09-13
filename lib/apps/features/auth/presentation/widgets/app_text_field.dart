import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppTextFieldType { text, email, password, phone, search, multiline }

class AppTextField extends StatefulWidget {
  final String hintText;
  final AppTextFieldType type;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final Border? border;

  const AppTextField({
    super.key,
    required this.hintText,
    this.type = AppTextFieldType.text,
    this.controller,
    this.validator,
    this.border,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: widget.border,
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        onChanged: widget.onChanged,

        obscureText: widget.type == AppTextFieldType.password
            ? obscurePassword
            : false,

        keyboardType: _getKeyboardType(),

        maxLines: widget.type == AppTextFieldType.multiline ? 4 : 1,

        minLines: widget.type == AppTextFieldType.multiline ? 3 : 1,

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,

          suffixIcon: widget.type == AppTextFieldType.password
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  child: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : widget.suffixIcon,
        ),
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
      case AppTextFieldType.search:
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }
}
