import 'package:animated_button_validator/src/ui/presentation/home_page.dart';
import 'package:animated_button_validator/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class AnimatedButtonValidatorApp extends StatelessWidget {
  const AnimatedButtonValidatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      color: CustomColors.primary,
    );
  }
}
