import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/screen/favorited_none_data_screen.dart';
import 'package:cooking_recipe_app/View/screen/joke_screen.dart';
import 'package:cooking_recipe_app/View/screen/recipes_screen.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOption = <Widget>[
    RecipesScreen(recipesViewModel: RecipesViewModel()),
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
