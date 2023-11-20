import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String label;
  final double horizontalPadding;
  final VoidCallback? onPressed;

  const LoginButton({
    Key? key,
    required this.label,
    this.horizontalPadding = 25,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    );
  }
}
