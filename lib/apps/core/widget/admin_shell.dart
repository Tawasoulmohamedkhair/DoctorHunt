import 'package:doctor_hunt/apps/admin/features/navigation/widgets/admin_navigation_bar.dart';
import 'package:flutter/material.dart';

class AdminShell extends StatelessWidget {
  const AdminShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const AdminNavigationBar(),
    );
  }
}
