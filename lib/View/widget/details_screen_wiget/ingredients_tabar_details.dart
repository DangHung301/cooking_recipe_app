import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Model/ingredient.dart';
import 'package:cooking_recipe_app/ViewModel/ingredient_viewmodel.dart';
import 'package:flutter/material.dart';

class IngredientsTabarDetails extends StatefulWidget {
  int id;
  IngredientViewModel ingredientViewModel;

  IngredientsTabarDetails(
      {required this.id, required this.ingredientViewModel});

  @override
  _IngredientsTabarDetailsState createState() =>
      _IngredientsTabarDetailsState();
}

class _IngredientsTabarDetailsState extends State<IngredientsTabarDetails> {
  @override
  void initState() {
    widget.ingredientViewModel.getIngredient(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    widget.ingredientViewModel.dispose();
    super.initState();
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
          print(snapshot.data?[1].image);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return _itemIngredients(
                        image: '${snapshot.data?[index].image}',
                        name: '${snapshot.data?[index].name}',
                        original: '${snapshot.data?[index].original}',
                        size: size);
                  })
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
    required Size size}) {
  return Container(
    width: size.width,
    height: size.height * 0.1,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: size.width * 0.3,
            height: size.height * 0.1,

            decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: NetworkImage('$image'), fit: BoxFit.cover),
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)),
            ),

            child: CachedNetworkImage(
              imageUrl: "$image",
              fit: BoxFit.cover,
              width: size.width * 0.3,
              height: size.height * 0.1,

              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        ),
        Expanded(
            flex: 7,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6,
                ),
                Text(
                  '$name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '$original',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ))
      ],
    ),
  );
}