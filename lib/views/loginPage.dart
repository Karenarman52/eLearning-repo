import 'package:elearn/theme/themeProvider.dart';
import 'package:elearn/utils/validatorUtility.dart';
import 'package:elearn/views/Home/homePage.dart';
import 'package:elearn/views/registration/registerPage.dart';
import 'package:elearn/widgets/eAlert.dart';
import 'package:elearn/widgets/eAppBarTitle.dart';
import 'package:elearn/widgets/eCircularProgressIndicator.dart';
import 'package:elearn/widgets/eNavigationButton.dart';
import 'package:elearn/widgets/eNavigationText.dart';
import 'package:elearn/widgets/eRegistrationLabel.dart';
import 'package:elearn/widgets/eTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  bool isLoginClicked = false;
  bool isforgotPasswordClicked = false;
  bool isNavigateToRegistrationClicked = false;
  String userAttribute = '';
  void forgotPassword() async{
    setState(() {
      isforgotPasswordClicked = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage(),));
    setState(() {
      isforgotPasswordClicked = false;
    });    
  }
  void login() async{
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoginClicked = true;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
      setState(() {
        isLoginClicked = false;
      });     
    }else{
      EAlert.showAlert(
        context, 
        'Alert', 
        'Please fill each field'
      );
    }
  }
  void navigateToRegistration() async{
    setState(() {
      isNavigateToRegistrationClicked = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage(),));
    setState(() {
      isNavigateToRegistrationClicked = false;
    });    
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EAppBarTitle(appBarTitle: "SIGN - IN", context: context,),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // logo
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Image.asset(
                        "assets/png/login.png",
                        height: Provider.of<ThemeProvider>(context).fontSize * 14, 
                      ),
                    ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const ERegistrationLabel(label: "Login as : "),
                        // Radio button for "patient"
                        RadioListTile<String>(
                          title: Text('Student', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: Provider.of<ThemeProvider>(context).fontSize),),
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
                          title: Text('Lecturer', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: Provider.of<ThemeProvider>(context).fontSize),),
                          value: 'Lecturer',
                          groupValue: userAttribute,
                          onChanged: (value) {
                            setState(() {
                              userAttribute = value!;
                            });
                          },
                        ),
                      ],
                    ),
                            
                     // title
                    userAttribute.isEmpty ? Text(
                      "Select to Continue...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Provider.of<ThemeProvider>(context).fontSize
                      ),
                      textAlign: TextAlign.center,
                    ) : Container(),
                          
                    const SizedBox(height: 28,),
                          
                    ETextFormField(
                      hintText: "Email or Phone", 
                      iconData: Icons.person, 
                      obscureText: false, 
                      textInputType: TextInputType.text,
                      textEditingController: emailPhoneController,
                      validator: (value) => ValidatorUtility.validateRequiredField(value, "This field can not be empty"),
                    ),
                          
                    const SizedBox(height: 28,),
                          
                    ETextFormField(
                      hintText: "Password", 
                      iconData: Icons.lock, 
                      obscureText: true, 
                      textInputType: TextInputType.text,
                      textEditingController: passwordController,
                      validator: (value) => ValidatorUtility.validateRequiredField(value, "Please enter your password"),
                    ),
                          
                    const SizedBox(height: 28,),
                          
                    isforgotPasswordClicked ? 
                    const Center(child: ECircularProgressIndicator()):
                    ENavigationText(
                      title: "Forgot password?",
                      onTap: forgotPassword,
                    ),
                    const SizedBox(height: 28,),
                
                    if(userAttribute == 'Student')...[
                          
                      isLoginClicked ? 
                      const Center(child: ECircularProgressIndicator()):
                      ENavigationButton(
                        title: "Sign - In (Student)",
                        onTap: login,
                      ),
                      const SizedBox(height: 28,),
                          
                      isNavigateToRegistrationClicked ? 
                      const Center(child: ECircularProgressIndicator()):
                      ENavigationText(
                        title: "Don't have elearn account",
                        onTap: navigateToRegistration,
                      ),
                      const SizedBox(height: 28,),
                          
                    ]else if(userAttribute == 'Lecturer')...[
                          
                      isLoginClicked ? 
                      const Center(child: ECircularProgressIndicator()):
                      ENavigationButton(
                        title: "Sign - In (Lecturer)",
                        onTap: login,
                      ),
                      const SizedBox(height: 28,),
                          
                      isNavigateToRegistrationClicked ? 
                      const Center(child: ECircularProgressIndicator()):
                      ENavigationText(
                        title: "Don't have elearn account",
                        onTap: navigateToRegistration,
                      ),
                      const SizedBox(height: 28,),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}