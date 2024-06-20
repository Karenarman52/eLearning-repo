import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;
  const CustomScrollBar({super.key, required this.child, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: Theme.of(context).colorScheme.inversePrimary,
      radius: const Radius.circular(7),
      thickness: 8,
      fadeDuration: const Duration(milliseconds: 500),
      controller: scrollController,
      child: child
    );
  }
}
