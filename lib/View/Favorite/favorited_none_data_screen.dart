import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:flutter/material.dart';

class FavoriteNoneDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.3,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('$images/no_data_recipes.png'),
          )),
        ),
      ],
    )));
  }
}
