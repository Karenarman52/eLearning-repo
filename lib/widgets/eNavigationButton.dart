
import 'dart:ui';

import 'package:elearn/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ENavigationButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ENavigationButton({
    super.key, 
    required this.title, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(21)
        ),
        padding:  EdgeInsets.all( Provider.of<ThemeProvider>(context).fontSize + 7),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
              fontSize: Provider.of<ThemeProvider>(context).fontSize,
            ),
          ),
        ),
      ),
    );
  }
}