import 'package:elearn/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EAlert {
  static void showAlert(BuildContext context, String title, String alertMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontSize: Provider.of<ThemeProvider>(context).fontSize + 7,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),
        content: Text(
          alertMessage,
          style: TextStyle(
            fontSize: Provider.of<ThemeProvider>(context).fontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.error
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style: TextStyle(
                fontSize: Provider.of<ThemeProvider>(context).fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}