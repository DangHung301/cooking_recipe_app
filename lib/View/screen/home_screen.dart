import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/screen/favorited_none_data_screen.dart';
import 'package:cooking_recipe_app/View/screen/joke_screen.dart';
import 'package:cooking_recipe_app/View/screen/recipes_screen.dart';
import 'package:flutter/material.dart';

class HomeRecipesScreen extends StatefulWidget {
  @override
  _HomeRecipesScreenState createState() => _HomeRecipesScreenState();
}

class _HomeRecipesScreenState extends State<HomeRecipesScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOption = <Widget>[
    RecipesScreen(),
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
          onTap: _onItemTapped),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.restaurant),
        backgroundColor: bgrFoatingButton,
      ),
    );
  }
}
