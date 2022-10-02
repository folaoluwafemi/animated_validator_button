import 'package:flutter/material.dart';

extension NumExtension on num {
  SizedBox get boxHeight => SizedBox(height: toDouble());

  SizedBox get boxWidth => SizedBox(width: toDouble());

  double get percentage => this * 100;

  double percent(double value) => (value / 100) * this;
}

extension BuildContextExtension on BuildContext {
  Size get queryScreenSize => MediaQuery.of(this).size;
}
