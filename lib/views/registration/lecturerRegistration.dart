import 'package:elearn/utils/validatorUtility.dart';
import 'package:elearn/views/Home/homePage.dart';
import 'package:elearn/views/Home/passwordGenerator.dart';
import 'package:elearn/views/loginPage.dart';
import 'package:elearn/widgets/eAlert.dart';
import 'package:elearn/widgets/eCircularProgressIndicator.dart';
import 'package:elearn/widgets/eNavigationButton.dart';
import 'package:elearn/widgets/eNavigationText.dart';
import 'package:elearn/widgets/eRegistrationLabel.dart';
import 'package:elearn/widgets/eTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LecturerRegistration extends StatefulWidget {
  const LecturerRegistration({super.key});

  @override
  State<LecturerRegistration> createState() => _LecturerRegistrationState();
}

class _LecturerRegistrationState extends State<LecturerRegistration> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  bool isRegisterClicked = false;
  bool isToLogin = false;

  void registerNow()  async{
    if (_formKey.currentState!.validate()) {
      setState(() {
        isRegisterClicked = true;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
      setState(() {
        isRegisterClicked = false;
      });  
    }else{
      EAlert.showAlert(
        context, 
        'Invalid Data', 
        'Please enter valid data in all fields.'
      );
    }
  }
  void toLogin()  async{
    setState(() {
      isToLogin = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
    setState(() {
      isToLogin = false;
    });      
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 28,
          ),
          const ERegistrationLabel(label: "Your Full Name"),
          ETextFormField(
            hintText: "Name",
            iconData: Icons.person,
            obscureText: false,
            textInputType: TextInputType.name,
            textEditingController: nameController,
            validator:(value) => ValidatorUtility.validateFullName(value)
          ),
          const SizedBox(
            height: 28,
          ),
          const ERegistrationLabel(label: "Your Valid Email"),
          ETextFormField(
            hintText: "Email",
            iconData: Icons.mail,
            obscureText: false,
            textInputType: TextInputType.emailAddress,
            textEditingController: emailController,
            validator:(value) => ValidatorUtility.validateEmail(value)
          ),
          const SizedBox(
            height: 28,
          ),
          const ERegistrationLabel(label: "Your Valid Phone Number"),
          ETextFormField(
            hintText: "Phone Number",
            iconData: Icons.phone,
            obscureText: false,
            textInputType: TextInputType.phone,
            textEditingController: phoneController,
            validator: (value) => ValidatorUtility.validatePhoneNumber(value),
          ),
          const SizedBox(
            height: 28,
          ),
          const ERegistrationLabel(label: "Your Profession"),
          ETextFormField(
            hintText: "Profession",
            iconData: CupertinoIcons.text_badge_checkmark,
            obscureText: false,
            textInputType: TextInputType.text,
            textEditingController: professionController,
            validator: (value) => ValidatorUtility.validateRequiredField(value, "Please fill your Profession"),
          ),
          const SizedBox(
            height: 28,
          ),
          ENavigationText(
            title: "Auto-Generate Strong Password", 
            onTap: () {
              String password = PasswordGenerator.generate();
              setState(() {
                passwordController.text = password;
                confirmpasswordController.text = password;
              });
            },
          ),
          const ERegistrationLabel(label: "Your Password"),
          ETextFormField(
            hintText: "Password",
            iconData: Icons.lock,
            obscureText: true,
            textInputType: TextInputType.text,
            textEditingController: passwordController,
            validator: (value) => ValidatorUtility.validatePassword(value),
          ),
          const SizedBox(
            height: 28,
          ),
          const ERegistrationLabel(label: "Repeat Password"),
          ETextFormField(
            hintText: "Confirm Password",
            iconData: Icons.lock,
            obscureText: true,
            textInputType: TextInputType.text,
            textEditingController: confirmpasswordController,
            validator: (value) => ValidatorUtility.validateComfirmPassword(value, passwordController.text),
          ),
          const SizedBox(
            height: 28,
          ),
          isRegisterClicked
              ? const Center(child:  ECircularProgressIndicator())
              : ENavigationButton(
                  title: "Register Now!",
                  onTap: registerNow,
                ),
          const SizedBox(
            height: 7,
          ),
          isToLogin
              ? const Center(child:  ECircularProgressIndicator()) :
          ENavigationText(
            onTap: toLogin,
            title: "I have elearn account",
          ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}