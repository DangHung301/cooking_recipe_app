import 'package:cooking_recipe_app/Helper/constan/theme.dart';
import 'package:cooking_recipe_app/Helper/database/recipe_database.dart';
import 'package:cooking_recipe_app/View/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeDatabase.instance.database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isTheme = false;

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