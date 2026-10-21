import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class MonthNavigation extends StatelessWidget {
  const MonthNavigation({
    super.key,
    required this.month,
    required this.onPrevious,
    required this.onNext,
    required this.canGoPrevious,
    required this.canGoNext,
  });

  final DateTime month;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool canGoPrevious;
  final bool canGoNext;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    final monthNames = [
      t.january,
      t.february,
      t.march,
      t.april,
      t.may,
      t.june,
      t.july,
      t.august,
      t.september,
      t.october,
      t.november,
      t.december,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: canGoPrevious ? onPrevious : null,
          icon: const Icon(Icons.chevron_left),
        ),
        Text(
          '${monthNames[month.month - 1]} ${month.year}',
          style: context.semiBoldPx16,
        ),
        IconButton(
          onPressed: canGoNext ? onNext : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
