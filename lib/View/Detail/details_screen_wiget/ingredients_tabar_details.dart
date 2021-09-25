import 'package:cooking_recipe_app/Model/ingredient.dart';
import 'package:cooking_recipe_app/ViewModel/ingredient_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IngredientsTabarDetails extends StatefulWidget {
  final int id;
  final IngredientViewModel ingredientViewModel;

  IngredientsTabarDetails(
      {required this.id, required this.ingredientViewModel});

  @override
  _IngredientsTabarDetailsState createState() =>
      _IngredientsTabarDetailsState();
}

class _IngredientsTabarDetailsState extends State<IngredientsTabarDetails> {
  @override
  void initState() {
    super.initState();
    widget.ingredientViewModel.getIngredient(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: widget.ingredientViewModel.subject.stream,
        builder: (context, AsyncSnapshot<List<Ingredient>> snapshot) {
          if (snapshot.hasError) {
            Text('${snapshot.hasError.toString()}');
          }

          final datas = snapshot.data ?? [];

          return snapshot.hasData
              ? datas.isNotEmpty
                  ? ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        return _itemIngredients(
                            image: '${datas[index].image}',
                            name: '${datas[index].name}',
                            original: '${datas[index].original}',
                            size: size, context: context);
                      })
                  : Center(
                      child: Text(AppLocalizations.of(context)?.empty ?? ''),
                    )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}

Widget _itemIngredients(
    {required String image,
    required String name,
    required String original,
    required Size size,required  BuildContext context}) {
  return Container(
    width: size.width,
    height: size.height * 0.15,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),

    decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://spoonacular.com/cdn/ingredients_100x100/"+"$image"), fit: BoxFit.cover),
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)),
            ),
          ),
        ),
        Expanded(child: SizedBox(width: 10,)),
        Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$name',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: Text(
                    '$original',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12),
                  ),
                )
              ],
            ))
      ],
    ),
  );
}
