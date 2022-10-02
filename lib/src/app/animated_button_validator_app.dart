import 'package:animated_button_validator/src/ui/presentation/home_page.dart';
import 'package:flutter/material.dart';

class AnimatedButtonValidatorApp extends StatelessWidget {
  const AnimatedButtonValidatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          onPrimary: Colors.white,
          primary: Colors.blue.shade800,
        ),
      ),
    );
  }
}
