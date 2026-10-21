import 'package:flutter/material.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';

class RateDoctorDialog extends StatefulWidget {
  const RateDoctorDialog({super.key});

  @override
  State<RateDoctorDialog> createState() => RateDoctorDialogState();
}

class RateDoctorDialogState extends State<RateDoctorDialog> {
  int _rating = 5;

  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AlertDialog(
      title: Text(t.rateDoctor),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(t.howWasYourExperience),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final star = index + 1;

              return IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  setState(() => _rating = star);
                },
                icon: Icon(
                  star <= _rating ? Icons.star : Icons.star_border,
                  color: const Color(0xFFFFB400),
                  size: 30,
                ),
              );
            }),
          ),
          TextField(
            controller: _commentController,
            maxLines: 3,
            maxLength: 300,
            decoration:  InputDecoration(
              labelText: t.commentOptional,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop({
              'rating': _rating,
              'comment': _commentController.text.trim(),
            });
          },
          child: Text(t.submitReview),
        ),
      ],
    );
  }
}
