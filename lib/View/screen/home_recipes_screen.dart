import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/screen/favorite_has_data_screen.dart';
import 'package:cooking_recipe_app/View/screen/favorited_none_data_screen.dart';
import 'package:cooking_recipe_app/View/screen/joke_screen.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/deltails_non_connect.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class HomeRecipesScreen extends StatefulWidget {
  @override
  _HomeRecipesScreenState createState() => _HomeRecipesScreenState();
}

class _HomeRecipesScreenState extends State<HomeRecipesScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOption = <Widget>[
    RecipesItem(),
    FavoriteNoneDataScreen(),
    JokeScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: bgrFoatingButton,
              automaticallyImplyLeading: false,
              title: Text('Recipes'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.filter_list_outlined)),
              ],
            )
          : _selectedIndex == 1
              ? AppBar(
                  backgroundColor: bgrFoatingButton,
                  automaticallyImplyLeading: false,
                  title: Text('Favorite Recipes'),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu_open)),
                  ],
                )
              : AppBar(
                  backgroundColor: bgrFoatingButton,
                  automaticallyImplyLeading: false,
                  title: Text('Food joke'),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share)),
                  ],
                ),
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: bgrFoatingButton,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.alternate_email_outlined), label: "Joke"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.restaurant),
        backgroundColor: bgrFoatingButton,
      ),
    );
  }
}
