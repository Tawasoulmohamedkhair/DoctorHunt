// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitleWidget extends StatelessWidget {
  const AuthTitleWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.medium24black),
        SizedBox(height: 15.h),

        Text(
          description,
          textAlign: TextAlign.center,
          style: context.regular14textSub,
        ),
      ],
    );
  }
}
