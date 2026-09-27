import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class RichTextWidget extends StatefulWidget {
  const RichTextWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  final String text1;
  final String text2;
  final VoidCallback onTap;

  @override
  State<RichTextWidget> createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  late final TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();

    _tapRecognizer = TapGestureRecognizer()..onTap = widget.onTap;
  }

  @override
  void didUpdateWidget(covariant RichTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.onTap != widget.onTap) {
      _tapRecognizer.onTap = widget.onTap;
    }
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget.text1,
        style: context.regular14primaryLight,
        children: [
          TextSpan(
            text: widget.text2,
            style: context.regular14primaryLight,
            recognizer: _tapRecognizer,
          ),
        ],
      ),
    );
  }
}
