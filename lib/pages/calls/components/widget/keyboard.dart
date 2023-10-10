
  import 'package:chat_mobile_app/theme/colors.dart';
import 'package:flutter/material.dart';

class NumericButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const NumericButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
       style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 30.0),
      ),
    );
  }
}