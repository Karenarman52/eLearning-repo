import 'dart:math';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color getRandomColor() {
    // Generate random values for RGB components
    final random = Random();
    var r = random.nextInt(128);
    var g = random.nextInt(128);
    var b = random.nextInt(128);

    // Ensure that the resulting color is not brighter than white
    while (r + g + b > 500) {
      r = random.nextInt(128);
      g = random.nextInt(128);
      b = random.nextInt(128);
    }
    
    return Color.fromARGB(255, r, g, b); // Return random color
  }
}