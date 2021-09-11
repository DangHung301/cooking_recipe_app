
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/widget/item_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class HomeRecipesScreen extends StatefulWidget{
  @override
  _HomeRecipesScreenState createState() => _HomeRecipesScreenState();
}

class _HomeRecipesScreenState extends State<HomeRecipesScreen> {
  int _currentIndex = 0;

  static const List<Widget> _widgetOption = <Widget>[
    Text('nac'),
    Text('ascas'),
    Text('vasva'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Recipes'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_outlined)),
        ],
      ),
      body: ItemRecipes(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: purplish_blue,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.alternate_email_outlined)  , label: "Joker"),
        ],
        currentIndex: _currentIndex,

        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.restaurant), backgroundColor: bgrFoatingButton,),
    );
  }
}


