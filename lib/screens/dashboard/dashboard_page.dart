import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/providers/counts.dart';

import '../widgets/weakly_chart.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      Text(
                        "${FirebaseAuth.instance.currentUser?.displayName}님 안녕하세요",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser?.photoURL ??
                            'https://via.placeholder.com/150'),
                  ),
                ],
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('오늘 목표한 착용시간은 8시간 입니다.'),
                leading: Icon(Icons.error_outline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counts>().changeWearingStatus();
                    },
                    child: context.watch<Counts>().isWearing
                        ? const Text('미 착용 중',
                            style: TextStyle(color: Colors.grey))
                        : const Text('착용 중',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
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
