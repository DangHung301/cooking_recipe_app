import 'package:connectivity/connectivity.dart';
import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/Service/fetch_data_recipes.dart';
import 'package:cooking_recipe_app/View/screen/details_screen.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  final RecipesViewModel recipesViewModel;


  RecipesScreen({required this.recipesViewModel});

  @override
  _RecipesItemState createState() => _RecipesItemState();
}

class _RecipesItemState extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.recipesViewModel.fetchRecipes();
  }

  @override
  void dispose() {
    widget.recipesViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
        body: StreamBuilder(
            stream: widget.recipesViewModel.subject.stream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Recipes>> snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              print(snapshot.hasData);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: RecipesItem(
                              vegan: snapshot.data![index].vegan,
                              aggregateLikes:
                                  snapshot.data![index].aggregateLikes,
                              id: snapshot.data![index].id,
                              title: '${snapshot.data![index].title}',
                              readyInMinutes:
                                  snapshot.data![index].readyInMinutes,
                              image: '${snapshot.data![index].image}',
                              summary: '${snapshot.data![index].summary}'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen()));
                          },
                        );
                      })
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
