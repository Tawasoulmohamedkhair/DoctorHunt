import 'package:doctor_hunt/apps/core/extension/responsive_media_query.dart';
import 'package:flutter/material.dart';

class DoctorsEmptyState extends StatelessWidget {
  const DoctorsEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.medical_services_outlined,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconSize = context.w(80);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(24),
          vertical: context.h(40),
        ),
        child: Semantics(
          container: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: ExcludeSemantics(
                  child: Icon(
                    icon,
                    size: context.r(40),
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: context.h(20)),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: context.h(8)),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(height: 1.6),
              ),
              if (onAction != null && actionLabel != null) ...[
                SizedBox(height: context.h(20)),
                FilledButton(onPressed: onAction, child: Text(actionLabel!)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
