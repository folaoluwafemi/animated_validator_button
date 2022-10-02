import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final double? width;
  final Widget child;

  const Button({
    Key? key,
    required this.onPressed,
    this.color,
    required this.child,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        color: color ?? Colors.blue.shade800,
        focusColor: color ?? Colors.blue.shade800,
        padding: const EdgeInsets.all(20),
        child: Center(child: child),
      ),
    );
  }
}
