import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/widget/food_item.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
import 'package:flutter/material.dart';

class FavoriteHasDataScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RecipesItem();
  }

}