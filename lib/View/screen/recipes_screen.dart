import 'package:cooking_recipe_app/Helper/config/remove_text_html.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/screen/details_screen.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
import 'package:cooking_recipe_app/ViewModel/event_recipe_viewmodel.dart';
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
    super.dispose();
    widget.recipesViewModel.dispose();
  }
  EventRecipeViewmodel _eventRecipeViewmodel = EventRecipeViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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

              final datas = snapshot.data ?? [];

              print(snapshot.hasData);
              return datas.isNotEmpty
                  ? ListView.builder(
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
                                  removeAllHtmlTags('${datas[index].summary}')),
                          onTap: () async{
                            bool checkObj = await _eventRecipeViewmodel.isFavorite(datas[index].id);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          recipes:  datas[index],
                                          eventRecipeViewmodel:
                                              EventRecipeViewmodel(), checkObj: checkObj),
                                        ));
                            setState(() {});
                          },
                        );
                      })
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
