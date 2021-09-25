import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/Recipe/recipes_screen_widget/recipes_item.dart';
import 'package:cooking_recipe_app/View/Detail/details_screen.dart';
import 'package:cooking_recipe_app/ViewModel/favorite_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'buttom_sheet_widget/button_sheet_widget.dart';
import 'buttom_sheet_widget/filter_widget.dart';
enum RecipeStatus { search, recipes }

class RecipesScreen extends StatefulWidget {
  final RecipesViewModel recipesViewModel;

  RecipesScreen({required this.recipesViewModel});

  @override
  _RecipesItemState createState() => _RecipesItemState();
}

class _RecipesItemState extends State<RecipesScreen> {
  RecipeStatus recipeStatus = RecipeStatus.recipes;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.recipesViewModel.fetchRecipes();
  }

  EventRecipeViewmodel _eventRecipeViewmodel = EventRecipeViewmodel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBar(size),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,

                builder: (BuildContext context) {
                  return ButtonSheetWidget(recipesViewModel: widget.recipesViewModel);
                });
          },
          child: Icon(Icons.restaurant),
          backgroundColor: bgrFoatingButton,
        ),
        body: StreamBuilder(
            stream: recipeStatus == RecipeStatus.recipes
                ? widget.recipesViewModel.subjectlistDefaut.stream
                : widget.recipesViewModel.subjectListSearch.stream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Recipes>> snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              final datas = snapshot.data ?? [];
              print(snapshot.hasData);
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: RecipesItem(
                              vegan: datas[index].vegan,
                              aggregateLikes: datas[index].aggregateLikes,
                              id: datas[index].id,
                              title: '${datas[index].title}',
                              readyInMinutes: datas[index].readyInMinutes,
                              image: '${datas[index].image}',
                              summary:
                                  '${datas[index].summary}'),
                          onTap: () async {
                            bool checkObj = await _eventRecipeViewmodel
                                .isFavorite(datas[index].id);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      recipes: datas[index],
                                      eventRecipeViewmodel:
                                          EventRecipeViewmodel(),
                                      checkObj: checkObj),
                                ));
                            setState(() {});
                          },
                        );
                      });

                case ConnectionState.waiting:
                  return Center(
                    child: Image.asset('$images/no_data_recipes.png'),
                  );

                case ConnectionState.none:
                default:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }
            }));
  }

  AppBar appBar(Size size) {
    if (recipeStatus == RecipeStatus.recipes) {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)?.recipe ?? ''),
        actions: [
          IconButton(
              onPressed: () {
                recipeStatus = RecipeStatus.search;
                widget.recipesViewModel.fetchRecipes();
                setState(() {});
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return FiltersBottonSheetWidget(
                        recipesViewModel: widget.recipesViewModel,
                      );
                    });
              },
              icon: Icon(Icons.filter_list_outlined)),
        ],
      );
    } else {
      return AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            width: size.width,
            color: Colors.white,
            child: TextField(
              controller: _textEditingController,
              onChanged: (query) {
                widget.recipesViewModel.delaySearch(query.trim());
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    recipeStatus = RecipeStatus.recipes;
                    widget.recipesViewModel.backHome();
                    setState(() {});
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.mic_rounded),
                  onPressed: () {},
                ),
                hintText: AppLocalizations.of(context)?.search ?? '',
              ),
            ),
          ));
    }
  }
}
