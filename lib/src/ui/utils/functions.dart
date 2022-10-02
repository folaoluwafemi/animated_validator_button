import 'package:flutter/material.dart';

abstract class Ui {
  static BorderRadius circularBorder(double radius) => BorderRadius.all(
        Radius.circular(radius),
      );

  static InputDecoration fieldDecoration({
    String? hintText,
    bool validated = false,
  }) =>
      InputDecoration(
        hintText: hintText,
        border: border(color: validated ? Colors.green : null),
        enabledBorder: border(color: validated ? Colors.green : null),
        focusedBorder: border(color: validated ? Colors.green : null),
        errorBorder: errorBorder(),
        focusedErrorBorder: errorBorder(),

      );

  static InputBorder border({Color? color}) => OutlineInputBorder(
        borderRadius: circularBorder(2),
        borderSide: BorderSide(
          width: 2,
          color: color ?? Colors.blueGrey.shade600,
        ),
      );

  static InputBorder errorBorder() => OutlineInputBorder(
        borderRadius: circularBorder(2),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      );
}
