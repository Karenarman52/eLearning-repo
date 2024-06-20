import 'package:elearn/theme/themeProvider.dart';
import 'package:elearn/views/loginPage.dart';
import 'package:elearn/views/registration/registerPage.dart';
import 'package:elearn/widgets/eCircularProgressIndicator.dart';
import 'package:elearn/widgets/eNavigationButton.dart';
import 'package:elearn/widgets/eNavigationText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isClicked = false;
  bool isSignClicked = false;  
  Future<void> agreeJoin() async {
    setState(() {
      isClicked = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    print("\n\n\nNavigating to Register page 🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻\n\n\n");
    await Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage(),));
    setState(() {
      isClicked = false;
    });
  }  
  Future<void> signIn() async {
    setState(() {
      isSignClicked = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    print("\n\n\nNavigating to Register page 🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻🚶👣🚶🏻‍♀️🚶🏻\n\n\n");
    await Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
    setState(() {
      isSignClicked = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    "assets/png/image-001.png",
                    height: Provider.of<ThemeProvider>(context).fontSize * 14, // controlling the height of the logo
                  ),
                ),
            
                const SizedBox(height: 48,), // Empty space
            
                // title
                Text(
                  "e-Learning",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Provider.of<ThemeProvider>(context).fontSize + 14
                  ),
                  textAlign: TextAlign.center,
                ),
            
                const SizedBox(height: 48,), // Empty space
            
                // sub title
                Text(
                  "The beautiful thing about learning is that nobody can take it away from you.",
                  style: TextStyle(
                    fontSize: Provider.of<ThemeProvider>(context).fontSize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48,), 
                isClicked ? const ECircularProgressIndicator():
                ENavigationButton(
                  title: "Agree & Join",
                  onTap: agreeJoin,
                ),
                const SizedBox(height: 14,),
                isSignClicked ? const ECircularProgressIndicator() :
                ENavigationText(
                  title: "Sign - In",
                  onTap: signIn,
                ),
                const SizedBox(height: 48,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}