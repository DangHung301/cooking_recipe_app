import 'package:cooking_recipe_app/Helper/extension.dart';
import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/screen/details_screen.dart';
import 'package:cooking_recipe_app/View/widget/buttom_sheet_widget/button_sheet_widget.dart';
import 'package:cooking_recipe_app/View/widget/buttom_sheet_widget/filter_widget.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
import 'package:cooking_recipe_app/ViewModel/event_recipe_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/floating_buttom_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';

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
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');

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
                  return ButtonSheetWidget();
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
                                  '${datas[index].summary}'.removeTextHtml()),
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
        title: Text('Recipes'),
        actions: [
          IconButton(
              onPressed: () {
                recipeStatus = RecipeStatus.search;
                setState(() {});
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return FiltersBottonSheetWidget(
                        floatingButtonViewmodel: FloatingButtonViewmodel(),
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
                    widget.recipesViewModel.fetchRecipes();
                    setState(() {});
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.mic_rounded),
                  onPressed: () {},
                ),
                hintText: 'Search...',
              ),
            ),
          ));
    }
  }
}
