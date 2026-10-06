import 'package:flutter/material.dart';

class AdminDoctorsScreen extends StatelessWidget {
  const AdminDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Admin Doctors Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}