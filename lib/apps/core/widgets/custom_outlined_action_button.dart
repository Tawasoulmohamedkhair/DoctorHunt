import 'package:flutter/material.dart';

class CustomOutlinedActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final Widget? icon;

  const CustomOutlinedActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.fontSize = 14,
    this.borderRadius = 8,
    this.fontWeight = FontWeight.w600,
    this.backgroundColor = const Color(0xFFFFF0F0),
    this.foregroundColor = const Color(0xFFF15B5D),
    this.borderColor = const Color(0xFFF15B5D),
    this.padding = EdgeInsets.zero,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          side: BorderSide(color: borderColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: TextStyle(
            fontFamily: 'Rubik',
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 8)],
            Flexible(child: Text(text, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
