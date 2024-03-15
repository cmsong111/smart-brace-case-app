import 'package:flutter/material.dart';

class PeripheralPage extends StatelessWidget {
  const PeripheralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peripheral'),
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
