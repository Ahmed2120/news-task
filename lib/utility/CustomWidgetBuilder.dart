import 'package:flutter/material.dart';

class CustomWidgetBuilder{

  static void showMessageDialog(BuildContext context,String message,bool dismissible,
      {String title = 'An error Occurred'}) {
    showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (ctx) => AlertDialog(
          title: const Text('An Error Occurred',),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Ok',),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }


}