import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/weakly_chart.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
        child: ListView(
          children: [
            Icon(Icons.receipt_long, size: 100, color: Colors.grey[300]),
            Text("${FirebaseAuth.instance.currentUser!.displayName} 님의 통계",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
            Text(
              "2021.10.01 - 2021.10.07",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "Today Activity",
              style: Theme.of(context).textTheme.headline5,
            ),
            const AspectRatio(
              aspectRatio: 1.6,
              child: WeaklyChart(),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
