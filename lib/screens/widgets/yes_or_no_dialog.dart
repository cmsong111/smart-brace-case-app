import 'package:flutter/material.dart';

void yesOrNoDialog(BuildContext context, String message,bool doPop, Function onYes) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              onYes();
              if (doPop) {
                Navigator.pop(context);
              }
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
