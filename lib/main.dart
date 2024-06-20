import 'package:elearn/theme/themeProvider.dart';
import 'package:elearn/views/introPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        // Theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const elearn(),
    ),
  );
}

class elearn extends StatefulWidget {
  const elearn({super.key});

  @override
  State<elearn> createState() => _elearnState();
}

class _elearnState extends State<elearn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'elearn',
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const IntroPage(),
      )
    );
  }
}