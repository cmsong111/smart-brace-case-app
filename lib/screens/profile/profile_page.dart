import 'package:flutter/material.dart';
import 'package:smart_brace_case/config/app_constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.setting);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
