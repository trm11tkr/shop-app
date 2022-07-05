import 'package:flutter/material.dart';

final customLightThemeData = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xFFD000FF),
    secondary: const Color(0xFF00DD19),
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontFamily: 'Arima',
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    textStyle: const TextStyle(
      fontSize: 18,
      fontFamily: 'Arima',
      fontWeight: FontWeight.w300,
      color: Color(0xFFD000FF),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 5,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'KantumruyPro',
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'KantumruyPro',
      fontWeight: FontWeight.w300,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'KantumruyPro',
    ),
  ),
);

final customDarkThemeData = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark().copyWith(
    primary: const Color(0xffca45fe6),
    secondary: const Color(0xFF7be77e),
  ),
  scaffoldBackgroundColor: const Color(0xFF141920),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontFamily: 'Arima',
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 5,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'KantumruyPro',
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'KantumruyPro',
      fontWeight: FontWeight.w300,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'KantumruyPro',
    ),
  ),
);
