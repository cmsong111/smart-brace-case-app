import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_brace_case/config/app_constant.dart';
import 'package:smart_brace_case/screens/widgets/yes_or_no_dialog.dart';

import '../../models/SettingItem.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: ListView.builder(
          itemCount: settingList.length,
          itemBuilder: (context, index) {
            final item = settingList[index];
            return ListTile(
              leading: item.icon,
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              onTap: () => item.onTap(context),
            );
          },
        ));
  }
}

List<SettingItem> settingList = [
  SettingItem(
    title: 'Profile',
    subtitle: 'Edit your profile',
    icon: const Icon(Icons.person),
    onTap: (BuildContext context) {},
  ),
  SettingItem(
    title: 'Notification',
    subtitle: 'Notification setting',
    icon: const Icon(Icons.notifications),
    onTap: (BuildContext context) {},
  ),
  SettingItem(
    title: 'Security',
    subtitle: 'Security setting',
    icon: const Icon(Icons.security),
    onTap: (BuildContext context) {},
  ),
  SettingItem(
    title: 'About',
    subtitle: 'About this app',
    icon: const Icon(Icons.info),
    onTap: (BuildContext context) {},
  ),
  SettingItem(
    title: 'Logout',
    subtitle: 'Logout from this app',
    icon: const Icon(Icons.logout),
    onTap: (BuildContext context) {
      yesOrNoDialog(context, "로그아웃 하시겠습니까?", false, () {
        FirebaseAuth.instance.signOut();
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacementNamed(context, AppRoute.login);
      });
    },
  ),
];
