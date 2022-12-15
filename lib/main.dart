import 'package:flutter/material.dart';
import 'screen/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  final MaterialColor kPrimaryColor = MaterialColor(
    0xFF1c0b2d,
    const <int, Color>{
      50: const Color(0xFF1c0b2d),
      100: const Color(0xFF1c0b2d),
      200: const Color(0xFF1c0b2d),
      300: const Color(0xFF1c0b2d),
      400: const Color(0xFF1c0b2d),
      500: const Color(0xFF1c0b2d),
      600: const Color(0xFF1c0b2d),
      700: const Color(0xFF1c0b2d),
      800: const Color(0xFF1c0b2d),
      900: const Color(0xFF1c0b2d),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle().apply(color: Colors.white),
          bodyText2: TextStyle().apply(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}
