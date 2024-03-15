import 'package:flutter/cupertino.dart';

class SettingItem {
  final String title;
  final String subtitle;
  final Icon icon;
  final void Function(BuildContext context) onTap;

  SettingItem(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap});
}
