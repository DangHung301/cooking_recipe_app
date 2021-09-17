import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: bgrFoatingButton,
          automaticallyImplyLeading: false,
          title: Text('Food joke'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        body: Container(
          height: size.height,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('$images/splash_screen.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('$images/card.png'))),
            ),
          ),
        ));
  }
}
