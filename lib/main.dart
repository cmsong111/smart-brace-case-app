import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/config/route.dart';
import 'package:smart_brace_case/providers/counts.dart';
import 'package:smart_brace_case/screens/main_home_page.dart';

import 'config/app_constant.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counts()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.home,
      routes: appRoute,
    );
  }
}
