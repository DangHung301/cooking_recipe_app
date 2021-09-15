import 'package:connectivity/connectivity.dart';
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/Service/fetch_data_recipes.dart';
import 'package:cooking_recipe_app/View/screen/details_screen.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesItemState createState() => _RecipesItemState();
}

class _RecipesItemState extends State<RecipesScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgrFoatingButton,
        automaticallyImplyLeading: false,
        title: Text('Recipes'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.filter_list_outlined)),
        ],
      ),
      body: InkWell(
        child: ListView.builder(itemCount: 5,itemBuilder: (context, index) {
          return RecipesItem(vegan: true,
              aggregateLikes: 100,
              id: 3,
              title: 'acascc',
              readyInMinutes: 11,
              image: 'ice-cubes.png',
              summary: 'sdvdvas');
        }),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen()));
        },
      )
    );
  }
}
