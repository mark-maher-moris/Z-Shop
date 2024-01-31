import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: fontName,
  primaryColor: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.black12,
  appBarTheme: AppBarTheme(color: Color.fromARGB(255, 62, 0, 128)),
);

ThemeData lightTheme = ThemeData(
  fontFamily: fontName,
  primaryColor: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Color.fromARGB(255, 173, 96, 255)),
);

const Color mainColor = Color.fromARGB(255, 255, 235, 56);

const String fontName = 'BrownSuger';
