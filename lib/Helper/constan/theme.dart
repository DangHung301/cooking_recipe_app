import 'package:flutter/material.dart';
import 'color.dart';

ThemeData lightMode = ThemeData(
  backgroundColor: bgrlighMode,
  primaryColor: bgrAppBar,
  canvasColor: bgrlighMode,
  appBarTheme: AppBarTheme(
    backgroundColor: bgrFoatingButton,
    brightness: Brightness.light,
  ),
);

ThemeData darkMode = ThemeData(
   textTheme: TextTheme(
     bodyText1: TextStyle(),
     bodyText2: TextStyle(),
   ).apply(
     bodyColor: Colors.white,
     displayColor: Colors.blue,
   ),
    cardTheme: CardTheme(color: Colors.black),
    backgroundColor: bgrDarkMode,
    primaryColor: bgrDarkMode,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: bgrDarkMode, unselectedItemColor: Colors.grey),
    canvasColor: bgrDarkMode,
    appBarTheme: AppBarTheme(
        backgroundColor: bgrDarkMode,
        brightness: Brightness.dark
    )
);