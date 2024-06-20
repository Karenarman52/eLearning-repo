
// ThemeProvider class which extends ChangeNotifier to manage theme-related states
import 'package:elearn/theme/dark_mode.dart';
import 'package:elearn/theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  // Private variable to hold the current theme data, initialized with dark mode
  ThemeData _themeData = lightMode;
  
  // Private variable to hold the state of high contrast mode
  bool _isHighContrast = false;
  
  // Private variable to hold the current font size
  double _fontSize = 14.0;

  // Getter for the current theme data
  ThemeData get themeData => _themeData;

  // Getter to check if the current theme is dark mode
  bool get isDarkMode => _themeData == darkMode;
  
  // Getter to check if high contrast mode is enabled
  bool get isHighContrast => _isHighContrast;
  
  // Getter for the current font size
  double get fontSize => _fontSize;

  // Setter for theme data which also notifies listeners about the change
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners(); // Notify listeners to rebuild widgets that depend on this provider
  }

  // Method to toggle between dark mode and light mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  // Method to toggle high contrast mode
  void toggleHighContrast() {
    _isHighContrast = !_isHighContrast;
    // Update the theme data based on the high contrast mode
    themeData = _isHighContrast ? highContrastTheme : (_themeData == darkMode ? darkMode : lightMode);
  }

  // Method to set a new font size
  void setFontSize(double size) {
    _fontSize = size;
    // _updateTheme(); // Update the theme to reflect the new font size
  }

  // Private method to update the theme data with the current settings
  void _updateTheme() {
    themeData = ThemeData(
      brightness: _themeData.brightness, // Maintain the current brightness (light or dark)
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: _fontSize), // Apply the font size to bodyText1 or bodyMedium
        bodySmall: TextStyle(fontSize: _fontSize), // Apply the font size to bodyText2 or bodySmall
        bodyLarge: TextStyle(fontSize: _fontSize),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: _isHighContrast ? Colors.black : Colors.blue, // Set secondary color based on high contrast mode
        background: _themeData.brightness == Brightness.dark ? Colors.black : Colors.white, // Set background color
        inversePrimary: _themeData.brightness == Brightness.dark ? Colors.white : Colors.black, // Set inverse primary color
        tertiary: _isHighContrast ? Colors.yellow : Colors.grey, // Set tertiary color based on high contrast mode
      ),
    );
    notifyListeners(); // Notify listeners to rebuild widgets that depend on this provider
  }
}

// Define the high contrast theme
final ThemeData highContrastTheme = ThemeData(
  brightness: Brightness.light, // Set brightness to light mode
  primaryColor: Colors.black, // Set primary color to black
  hintColor: Colors.yellow, // Set hint color to yellow
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 14.0), // Set default font size for bodyText1
    bodySmall: TextStyle(fontSize: 14.0), // Set default font size for bodyText2
  ),
);
