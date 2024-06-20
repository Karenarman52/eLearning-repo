import 'dart:math';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String _captcha = '';
  String _inputCaptcha = '';

  @override
  void initState() {
    super.initState();
    _generateCaptcha();
  }

  void _generateCaptcha() {
    final random = Random();
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    setState(() {
      _captcha = String.fromCharCodes(Iterable.generate(6, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text('CAPTCHA: $_captcha', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter CAPTCHA'),
              onChanged: (value) {
                _inputCaptcha = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the CAPTCHA';
                } else if (value != _captcha) {
                  return 'CAPTCHA does not match';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form submitted successfully')));
                }
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _generateCaptcha,
              child: Text('Refresh CAPTCHA'),
            ),
          ],
        ),
      ),
    );
  }
}
