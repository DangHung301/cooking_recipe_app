import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/screen/favorited_none_data_screen.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/recipes_item.dart';
import 'package:cooking_recipe_app/ViewModel/event_recipe_viewmodel.dart';
import 'package:flutter/material.dart';

class FavoriteHasDataScreen extends StatefulWidget {
  final EventRecipeViewmodel eventRecipeViewmodel;

  FavoriteHasDataScreen({required this.eventRecipeViewmodel});

  @override
  _FavoriteHasDataScreenState createState() => _FavoriteHasDataScreenState();
}

class _FavoriteHasDataScreenState extends State<FavoriteHasDataScreen> {
  @override
  void initState() {
    super.initState();
    widget.eventRecipeViewmodel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Favorite Recipes'),
          actions: [
            PopupMenuButton<int>(
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: InkWell(
                          child: Text('Delete all'),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        'Delete all?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      content: Text(
                                        'Are you sure you want to remove all your favorite recipes',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: Text('CANCEL')),
                                        TextButton(
                                          onPressed: () {
                                            widget.eventRecipeViewmodel
                                                .deleteAll();
                                            Navigator.pop(context, 'Cancel');
                                          },
                                          child: Text('YES'),
                                        ),
                                      ],
                                    ));
                          },
                        ),
                      )
                    ])
          ],
        ),
        body: StreamBuilder(
          stream: widget.eventRecipeViewmodel.subjectList.stream,
          builder: (context, AsyncSnapshot<List<Recipes>> snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.hasError.toString()}');
            }

            final datas = snapshot.data ?? [];

            return snapshot.hasData
                ? datas.isNotEmpty
                    ? ListView.builder(
                        itemCount: datas.length,
                        itemBuilder: (context, index) {
                          return RecipesItem(
                              vegan: datas[index].vegan,
                              aggregateLikes: datas[index].aggregateLikes,
                              id: datas[index].id,
                              title: datas[index].title,
                              readyInMinutes: datas[index].readyInMinutes,
                              image: datas[index].image,
                              summary: datas[index].summary);
                        })
                    : Center(
                        child: FavoriteNoneDataScreen(),
                      )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
