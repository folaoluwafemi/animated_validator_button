import 'package:animated_button_validator/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget child;

  const Button({
    Key? key,
    required this.onPressed,
    this.color = CustomColors.primary,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      padding: const EdgeInsets.all(10),
      child: Center(child: child),
    );
  }
}
