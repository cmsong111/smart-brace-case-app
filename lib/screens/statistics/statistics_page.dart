import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/weakly_chart.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.receipt_long, size: 100, color: Colors.grey[300]),
              ],
            ),
            Text(
              "${FirebaseAuth.instance.currentUser!.displayName} 님의 통계",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "2024.04.26 - 2024.05.03",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text("총 착용 횟수"),
              trailing:
                  Text("86시간", style: Theme.of(context).textTheme.titleMedium),
              leading: const Icon(Icons.access_time),
            ),
            ListTile(
              title: const Text("평균 착용 시간"),
              trailing: Text("${(86 / 7).toStringAsFixed(2)}시간",
                  style: Theme.of(context).textTheme.titleMedium),
              leading: const Icon(Icons.access_time),
            ),
            ListTile(
              title: const Text("최대 착용 시간"),
              trailing:
                  Text("16시간", style: Theme.of(context).textTheme.titleMedium),
              leading: const Icon(Icons.directions_walk),
            ),
            ListTile(
              title: const Text("이번주 남은 착용 시간"),
              trailing:
                  Text("34시간", style: Theme.of(context).textTheme.titleMedium),
              leading: const Icon(Icons.local_fire_department),
            ),
            const Divider(),
            const SizedBox(height: 20),
            Text(
              "최근 1주일 착용 그래프",
              style: Theme.of(context).textTheme.headlineSmall,
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
