import 'package:flutter/material.dart';

void loadingDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: <Widget>[
            const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(message),
            ),
          ],
        ),
      );
    },
  );
}