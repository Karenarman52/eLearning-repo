import 'package:elearn/theme/themeProvider.dart';
import 'package:elearn/utils/colorUtility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ECircularProgressIndicator extends StatelessWidget {
  const ECircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Provider.of<ThemeProvider>(context).fontSize + 7,
      height: Provider.of<ThemeProvider>(context).fontSize + 7,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: ColorUtils.getRandomColor(),
        ),
      ),
    );
  }
}