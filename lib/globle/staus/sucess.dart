import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showSuccessDialog(
  BuildContext context,
  String content,
  String buttonT,
  Future Function() param3,
) async {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Success'),
        content: Column(
          children: [
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(content),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: param3,
            child: Text(buttonT),
          ),
        ],
      ),
    );
  });
}
