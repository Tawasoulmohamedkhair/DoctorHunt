// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1;
  final String text2;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: context.regular14primaryLight,
        children: [
          TextSpan(
            text: text2,

            style: context.regular14primaryLight,
            recognizer: TapGestureRecognizer()..onTap = () => onTap(),
          ),
        ],
      ),
    );
  }
}
