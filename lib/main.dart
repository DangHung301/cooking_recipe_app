
import 'package:cooking_recipe_app/View/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Routes{

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {

        },
      title: 'Cooking recipe App',
      home: SplashScreen()
    );
    }
}