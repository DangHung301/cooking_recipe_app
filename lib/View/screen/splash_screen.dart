import 'dart:async';

import 'package:cooking_recipe_app/View/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTime();
  }

  _startTime() {
    final time = Duration(milliseconds: 3000);
    return Timer(time, _navigator);
  }

  void _navigator() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeRecipesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/splash_image.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                'Foody',
                style: TextStyle(fontSize: 50, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
