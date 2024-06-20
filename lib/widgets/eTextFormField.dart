import 'package:elearn/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ETextFormField extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final bool obscureText;
  final bool readOnly;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  const ETextFormField({
    super.key, 
    required this.hintText, 
    required this.iconData, 
    required this.obscureText,  
    required this.textInputType, 
    this.textEditingController, 
    this.readOnly = false,
    this.onChanged,
    this.validator,
  });

  @override
  State<ETextFormField> createState() => _ETextFormFieldState();
}

class _ETextFormFieldState extends State<ETextFormField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      onChanged: widget.onChanged,
      validator: widget.validator,
      readOnly: widget.readOnly,
      keyboardType: widget.textInputType,
      obscureText: showPassword ? false : widget.obscureText,
      decoration: InputDecoration(
        errorMaxLines: 3,
        errorStyle: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontStyle: FontStyle.italic,
          fontSize: Provider.of<ThemeProvider>(context).fontSize,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Theme.of(context).colorScheme.primary
          ),
          borderRadius: BorderRadius.circular(7.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
          borderRadius: BorderRadius.circular(7.0)
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: Provider.of<ThemeProvider>(context).fontSize,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        border: const OutlineInputBorder(),
        prefixIcon: Container(
          height: 50.0,
          width: 30.0,
          margin: const EdgeInsets.only(right: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(7.0),
            topLeft: Radius.circular(7.0)),
          ),
          child: Icon(
            widget.iconData,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),
        suffixIcon: widget.obscureText ? Container(
          height: 50.0,
          width: 30.0,
          margin: const EdgeInsets.only(right: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(7.0),
            topLeft: Radius.circular(7.0)),
          ),
          child: IconButton(
            onPressed: (){
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ) : null
      ),
    );
  }
}