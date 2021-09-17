import 'package:cooking_recipe_app/Helper/constan/theme.dart';
import 'package:cooking_recipe_app/View/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isTheme = false;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        themeMode: ThemeMode.system,
        theme: lightMode,
        darkTheme: darkMode,
        title: 'Cooking recipe App',
        home: SplashScreen()
    );
  }
}