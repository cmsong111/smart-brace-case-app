import 'package:flutter/material.dart';

class TodayWearIndicatorWidget extends StatefulWidget {
  const TodayWearIndicatorWidget({super.key});

  @override
  State<TodayWearIndicatorWidget> createState() =>
      _TodayWearIndicatorWidgetState();
}

class _TodayWearIndicatorWidgetState extends State<TodayWearIndicatorWidget> {
  var _targetTime = 12 * 60 + 30;
  var _wearingTime = 8 * 60;
  var _startWearingTime = DateTime(2021, 10, 1, 8, 0);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "목표 착용시간 ${_targetTime ~/ 60}시간 ${_targetTime % 60}분",
                  style: const TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${(_wearingTime / _targetTime * 100).toStringAsFixed(1)}%",
                  style: const TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            LinearProgressIndicator(
              value: _wearingTime / _targetTime,
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.calendar_month),
                Text(" 착용시작: ${_startWearingTime.year}년 ${_startWearingTime.month}월 ${_startWearingTime.day}일"),
                const Spacer(),
                const Icon(Icons.access_time),
                Text(" 착용시간 ${_wearingTime ~/ 60}시간 ${_wearingTime % 60}분"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
