import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl;

  LoginService({required this.baseUrl});

  Future<String> studentLogin(String emailPhone, String password) async {
    final url = Uri.parse('$baseUrl/student/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'emailPhone': emailPhone, 'password': password}),
    );

    if (response.statusCode == 200) {
      return 'Welcome Student';
    } else if (response.statusCode == 401) {
      return 'Oops! It seems like your username or password is incorrect. Please try again.';
    } else {
      return 'An error occurred. Please try again.';
    }
  }

  Future<String> teacherLogin(String emailPhone, String password) async {
    final url = Uri.parse('$baseUrl/teacher/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'emailPhone': emailPhone, 'password': password}),
    );

    if (response.statusCode == 200) {
      return 'Welcome Teacher';
    } else if (response.statusCode == 401) {
      return 'Oops! It seems like your username or password is incorrect. Please try again.';
    } else {
      return 'An error occurred. Please try again.';
    }
  }
}
