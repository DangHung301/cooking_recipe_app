import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/Recipe/recipes_screen_widget/recipes_item.dart';
import 'package:cooking_recipe_app/View/Detail/details_screen.dart';
import 'package:cooking_recipe_app/View/Favorite/favorited_none_data_screen.dart';
import 'package:cooking_recipe_app/ViewModel/favorite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(AppLocalizations.of(context)?.favorite_recipe ?? ''),
          actions: [
            PopupMenuButton<int>(
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: InkWell(
                          child: Text(
                              AppLocalizations.of(context)?.deleteAll ?? ''),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        AppLocalizations.of(context)
                                                ?.deleteAll ??
                                            '',
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
                                      ),
                                      content: Text(
                                        AppLocalizations.of(context)?.alert ?? '',
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: Colors.grey),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(AppLocalizations.of(context)?.cancel ?? '')),
                                        TextButton(
                                          onPressed: () {
                                            widget.eventRecipeViewmodel
                                                .deleteAll();
                                            Navigator.pop(context);
                                          },
                                          child: Text(AppLocalizations.of(context)?.yes ?? ''),
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
                          return InkWell(
                            onTap: () async {
                              final checkObj = await widget.eventRecipeViewmodel
                                  .isFavorite(datas[index].id);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          recipes: datas[index],
                                          eventRecipeViewmodel:
                                              EventRecipeViewmodel(),
                                          checkObj: checkObj))).then((value) =>
                                  widget.eventRecipeViewmodel.init());
                            },
                            child: RecipesItem(
                                vegan: datas[index].vegan,
                                aggregateLikes: datas[index].aggregateLikes,
                                id: datas[index].id,
                                title: datas[index].title,
                                readyInMinutes: datas[index].readyInMinutes,
                                image: datas[index].image,
                                summary: datas[index].summary),
                          );
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
