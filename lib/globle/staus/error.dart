import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String content) async {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Error'),
        content: Column(
          children: [
            // Container(
            //   child: Lottie.asset('assets/wrong.json',
            //       animate: true,
            //       height: relativeHeight * 50,
            //       width: relativeWidth * 50),
            // ),
            Text(content),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Okay'),
          ),
        ],
      ),
    );
  });
}
