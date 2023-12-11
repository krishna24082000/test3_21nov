import 'package:flutter/material.dart';

import '../../../main.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const BaseButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:Text(text),
    );
  }
}
