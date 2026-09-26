import 'package:doctor_hunt/apps/Patient/core/extension/responsive_media_query.dart';
import 'package:doctor_hunt/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: padding ?? EdgeInsets.symmetric(horizontal: context.w(20)),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.bg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
