import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/providers/counts.dart';

import '../widgets/progress_widget.dart';

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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            // 개인 프로필
            Row(
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
                CachedNetworkImage(
                  imageUrl: FirebaseAuth.instance.currentUser!.photoURL!,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // 각종 알림이
            const Card(
              child: ListTile(
                title: Text('오늘 목표한 착용시간은 8시간 입니다.'),
                leading: Icon(Icons.error_outline),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '교정기 착용 시간',
                  style: Theme.of(context).textTheme.headline5,
                ),
                // 착용 상태 버튼
                // TODO: Bluetooth 연결 상태에 따라서 버튼 활성화/비활성화
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
              ],
            ),
            const SizedBox(height: 10),
            TodayWearIndicatorWidget(),
            const SizedBox(height: 20),
            Text(
              '교정기 기기 정보',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2.5,
              children: const <Widget>[
                Card(
                  child: Center(
                    child: ListTile(
                      title: Text('교정기 종류'),
                      subtitle: Text('치아 유지 장치'),
                      leading: Icon(Icons.widgets),
                      isThreeLine: true,
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: ListTile(
                      title: Text('기기 배터리 상태'),
                      subtitle: Text('${70}%'),
                      leading: Icon(Icons.battery_4_bar),
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: ListTile(
                      title: Text('마지막 세척 일'),
                      subtitle: Text('${5}일 전'),
                      leading: Icon(Icons.shower),
                    ),
                  ),
                ),
                Card(
                  child: Center(
                    child: ListTile(
                      title: Text('마지막 동기화'),
                      subtitle: Text('${3}시간 전'),
                      leading: Icon(Icons.sync),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
