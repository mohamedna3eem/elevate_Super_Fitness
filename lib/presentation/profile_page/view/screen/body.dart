import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'هذا هو محتوى الصفحة (Body)',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
