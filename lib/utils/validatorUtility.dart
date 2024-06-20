class ValidatorUtility {
  static String? validateRequiredField(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }


  // Validate email with custom message
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    // Email regular expression pattern
    final RegExp emailRegExp = RegExp(
      r'^[^@]+@[^@]+\.[^@]+',
    );
    if (!emailRegExp.hasMatch(value)) {
      return "Invalid Email";
    }
    return null;
  }

  // Validate full name with at least two words
  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Name";
    }
    // Check if the input contains at least two words
    final RegExp fullNameRegExp = RegExp(r'^\s*\S+\s+\S+.*$');
    if (!fullNameRegExp.hasMatch(value)) {
      return "Please enter your full Name";
    }
    return null;
  }
  
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove all non-numeric characters
    String cleanedPhone = value.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the cleaned phone number is exactly 10 digits long
    if (cleanedPhone.length != 10) {
      return 'Phone number must be exactly 10 digits';
    }

    // Check if the phone number starts with '07', '06', or '08'
    if (!(cleanedPhone.startsWith('07') ||
          cleanedPhone.startsWith('06') ||
          cleanedPhone.startsWith('08'))) {
      return 'Phone number must start with 07, 06, or 08';
    }

    return null;
  }
  
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // Check if the password meets the criteria
    if (!_isLengthValid(value) ||
        !_containsUppercase(value) ||
        !_containsLowercase(value) ||
        !_containsDigit(value) ||
        !_containsSpecialCharacter(value)) {
      return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
    }

    return null;
  }
  
  static String? validateComfirmPassword(String? value, String? password) {
    if (value != password) {
      return 'Password Mismatched';
    }
    return null;
  }

  static bool _isLengthValid(String value) {
    return value.length >= 8;
  }

  static bool _containsUppercase(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }

  static bool _containsLowercase(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }

  static bool _containsDigit(String value) {
    return value.contains(RegExp(r'[0-9]'));
  }

  static bool _containsSpecialCharacter(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}