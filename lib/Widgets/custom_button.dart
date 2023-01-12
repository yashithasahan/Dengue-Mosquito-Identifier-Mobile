
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final VoidCallback onPressed;
  final Color textColor;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 40,
        width: 150,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: textColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
