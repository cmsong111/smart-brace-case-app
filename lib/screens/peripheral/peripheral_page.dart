import 'package:flutter/material.dart';
import 'package:smart_brace_case/config/app_constant.dart';

class PeripheralPage extends StatelessWidget {
  const PeripheralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peripheral'),
        actions: [
          IconButton(
              icon: const Icon(Icons.bluetooth),
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.connectBluetooth);
              }),
        ],
      ),
      body: const Center(
        child: Text(
          'Peripheral',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
