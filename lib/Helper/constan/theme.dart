import 'package:flutter/material.dart';
import 'color.dart';

ThemeData lightMode = ThemeData(
    backgroundColor: bgrlighMode,
    primaryColor: bgrlighMode,
    canvasColor: bgrlighMode,
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle()).apply(
        bodyColor: Colors.black87,
        displayColor: Colors.blue,
      fontFamily: 'Roboto',
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: bgrlighMode),
        textTheme: TextTheme(
            headline6: TextStyle(
                color: bgrlighMode, fontSize: 22, fontWeight: FontWeight.w600)),
        backgroundColor: bgrAppBar,
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bgrDarkMode, unselectedItemColor: Colors.grey),
    canvasColor: bgrDarkMode,
    appBarTheme: AppBarTheme(
      backgroundColor: bgrDarkMode,
    ));
