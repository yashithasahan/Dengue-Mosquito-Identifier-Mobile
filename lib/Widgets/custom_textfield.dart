import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController myController;
  final String? userHintText;
  final String? errorTextEmpty;
  final Icon userIcon;
  final bool? isPassword;
  const CustomTextField(
      {super.key,
      required this.myController,
      this.userHintText,
      this.isPassword,
      required this.userIcon,
      this.errorTextEmpty});

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  final _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginformKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 8),
        child: TextFormField(
          validator: widget.isPassword!
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter a password';
                  }
                  if (value.length < 8) {
                    return 'Pasword must contain at leaset 8 charcters ';
                  }
                  return null;
                }
              : (value) {
                  if (value == null || value.isEmpty) {
                    return widget.errorTextEmpty;
                  }
                  if (value.length < 6) {
                    return "At leaset 6 chracters required";
                  }
                  return null;
                },
          onTap: () {
            _loginformKey.currentState!.validate();
          },
          keyboardType: widget.isPassword!
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          enableSuggestions: widget.isPassword! ? false : true,
          autocorrect: widget.isPassword! ? false : true,
          obscureText: widget.isPassword ?? true,
          controller: widget.myController,
          decoration: InputDecoration(
              prefixIcon: widget.userIcon,
              suffixIcon: widget.isPassword!
                  ? IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF68CAF1), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF0E86D4), width: 2),
                  borderRadius: BorderRadius.circular(10)),
              fillColor: const Color(0xFFE3F7FF),
              filled: true,
              hintText: widget.userHintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(21))),
          autofocus: true,
          
        ),
      
        
      ),
      
    );
  }
}

