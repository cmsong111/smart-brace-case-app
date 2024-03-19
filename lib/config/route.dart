import 'package:smart_brace_case/config/app_constant.dart';

import '../screens/auth/login_page.dart';
import '../screens/auth/register_page.dart';
import '../screens/main_home_page.dart';
import '../screens/peripheral/connect_bluetooth_page.dart';
import '../screens/settings/profile_edit_page.dart';
import '../screens/settings/licenses.dart';
import '../screens/settings/setting_page.dart';

var appRoute = {
  AppRoute.home: (context) => const MyHomePage(),
  AppRoute.setting: (context) => const SettingPage(),
  AppRoute.login: (context) => const LoginPage(),
  AppRoute.register: (context) => const RegisterPage(),
  AppRoute.connectBluetooth: (context) => const ConnectBluetoothPage(),
  AppRoute.licenses: (context) => const LicensesListPage(),
  AppRoute.profilePageEdit: (context) => const ProfileEditPage(),
};