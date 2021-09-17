import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/screen/recipes_screen.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';

class FavoriteHasDataScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: bgrFoatingButton,
        automaticallyImplyLeading: false,
        title: Text('Favorite Recipes'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu_open)),
        ],
      ),

      body: RecipesScreen(recipesViewModel: RecipesViewModel(),),
    );
  }
}