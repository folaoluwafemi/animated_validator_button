import 'package:animated_button_validator/src/ui/utils/colors.dart';
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
        border: border(color: validated ? CustomColors.success : null),
        enabledBorder: border(color: validated ? CustomColors.success : null),
        focusedBorder: border(color: validated ? CustomColors.success : null),
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
