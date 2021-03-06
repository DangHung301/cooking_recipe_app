import 'package:cooking_recipe_app/View/Favorite/favorite_has_data_screen.dart';
import 'package:cooking_recipe_app/View/Recipe/recipes_screen_widget/reaction_item.dart';
import 'package:flutter/material.dart';

class RecipesItem extends StatelessWidget {
  final bool vegan;
  final int aggregateLikes;
  final int id;
  final String? title;
  final int readyInMinutes;
  final String? image;
  final String? summary;
  final Color? color;
  RecipesItem({required this.vegan, required this.aggregateLikes, required this.id, required this.title,
      required this.readyInMinutes, required this.image, required this.summary, this.color});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      color: color,
      child: Container(
        decoration:  BoxDecoration(
            border: Border.all(width: 1 , color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),

        ),
        height: size.height * 0.25,
        // padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                        '$image',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              flex: 4,
            ),
            Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          '$title',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                        maxLines: 2,),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '$summary',
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ReactionItem(
                          aggregateLikes: aggregateLikes,
                          readyInMinutes: readyInMinutes,
                          vegan: vegan,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
