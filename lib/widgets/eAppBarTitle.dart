import 'package:elearn/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EAppBarTitle extends StatefulWidget {
  final String appBarTitle;
  final BuildContext context;
  const EAppBarTitle({
    super.key, required this.appBarTitle, required this.context,
  });

  @override
  State<EAppBarTitle> createState() => _EAppBarTitleState();
}

class _EAppBarTitleState extends State<EAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.appBarTitle,
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.bold,
        fontSize: (Provider.of<ThemeProvider>(context).fontSize + 7), // Dynamic font size
      ),
    );
  }
}