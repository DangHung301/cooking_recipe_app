import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/Favorite/favorite_has_data_screen.dart';
import 'package:cooking_recipe_app/View/FoodJoke/joke_screen.dart';
import 'package:cooking_recipe_app/View/Recipe/recipes_screen.dart';
import 'package:cooking_recipe_app/ViewModel/favorite_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeRecipesScreen extends StatefulWidget {
  @override
  _HomeRecipesScreenState createState() => _HomeRecipesScreenState();
}

class _HomeRecipesScreenState extends State<HomeRecipesScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOption = <Widget>[
    RecipesScreen(
      recipesViewModel: RecipesViewModel(),
    ),
    FavoriteHasDataScreen(eventRecipeViewmodel: EventRecipeViewmodel()),
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
          selectedItemColor: bgrAppBar,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),
                label: AppLocalizations.of(context)?.recipe ?? ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: AppLocalizations.of(context)?.favorite ?? ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.alternate_email_outlined),
                label: AppLocalizations.of(context)?.joke ?? ''),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped),
    );
  }
}
