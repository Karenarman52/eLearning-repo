import 'package:elearn/theme/themeProvider.dart';
import 'package:elearn/views/registration/lecturerRegistration.dart';
import 'package:elearn/views/registration/studentRegistration.dart';
import 'package:elearn/widgets/eAppBarTitle.dart';
import 'package:elearn/widgets/eRegistrationLabel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String userAttribute = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EAppBarTitle(
          appBarTitle: "REGISTER", context: context,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                "assets/png/register.png",
                height: 120, // controlling the height of the logo
              ),
            ),

            userAttribute.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ERegistrationLabel(label: "You as : "),
                      // Radio button for "Student"
                      RadioListTile<String>(
                        title: Text(
                          'Student',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize:
                                  Provider.of<ThemeProvider>(context).fontSize),
                        ),
                        value: 'Student',
                        groupValue: userAttribute,
                        onChanged: (value) {
                          setState(() {
                            userAttribute = value!;
                          });
                        },
                      ),
                      // Radio button for ""doctor"
                      RadioListTile<String>(
                        title: Text(
                          'Lecturer',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize:
                                  Provider.of<ThemeProvider>(context).fontSize),
                        ),
                        value: 'Lecturer',
                        groupValue: userAttribute,
                        onChanged: (value) {
                          setState(() {
                            userAttribute = value!;
                          });
                        },
                      ),
                    ],
                  )
                : Container(),

            userAttribute.isEmpty
                ? Text(
                    "Select to Continue...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Provider.of<ThemeProvider>(context).fontSize),
                    textAlign: TextAlign.center,
                  )
                : Container(),

            if (userAttribute == 'Student') ...[
              // is doctor
              const StudentRegistration(),
            ] else if (userAttribute == 'Lecturer') ...[
              // is patient
              const LecturerRegistration(),
            ],
          ],
        ),
      ),
    );
  }
}