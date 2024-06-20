import 'package:elearn/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ENavigationText extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ENavigationText({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21)
        ),
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