import 'package:flutter/material.dart';

import '../widgets/weakly_chart.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(
              'Weekly Activity',
              style: Theme.of(context).textTheme.headline5,
            ),
            const AspectRatio(
              aspectRatio: 1.6,
              child: WeaklyChart(),
            ),
            const Divider(),
            Text(
              "Today Activity",
              style: Theme.of(context).textTheme.headline5,
            ),
            const Card(
              child: ListTile(
                title: Text('오늘 착용 시간'),
                subtitle: Text('8시간 30분'),
                leading: Icon(Icons.schedule),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
