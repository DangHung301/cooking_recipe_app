import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/Service/fetch_data_recipes.dart';
import 'package:cooking_recipe_app/View/screen/details_screen.dart';
import 'package:cooking_recipe_app/View/widget/food_item.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/reaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipesItem extends StatefulWidget {
  @override
  _RecipesItemState createState() => _RecipesItemState();
}

class _RecipesItemState extends State<RecipesItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder( 
        future: FetchDataRecipes.fetchRecipes(),
        builder: (context, AsyncSnapshot<List<Recipes>> snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return snapshot.hasData
              ? InkWell(
                  child: FoodItem(snapshot.data, size),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen()));
                  },
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}