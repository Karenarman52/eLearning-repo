
import 'package:elearn/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ERegistrationLabel extends StatelessWidget {
  final String label;
  const ERegistrationLabel({
    super.key, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  8.0),
      child: Text(
        label,
      ),
    );
  }
}