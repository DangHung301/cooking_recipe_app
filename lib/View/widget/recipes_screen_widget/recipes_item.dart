import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/reaction_item.dart';
import 'package:flutter/material.dart';

class RecipesItem extends StatelessWidget {
  bool vegan;
  int? aggregateLikes;
  int? id;
  String? title;
  int? readyInMinutes;
  String? image;
  String? summary;

  RecipesItem({required this.vegan, required this.aggregateLikes, required this.id, required this.title,
      required this.readyInMinutes, required this.image, required this.summary});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration:  BoxDecoration(
            border: Border.all(width: 1 , color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),

        ),
        height: size.height * 0.2,
        // padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: size.height * 0.2,
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
                        flex: 2,
                        child: Text(
                          '$title',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '$summary',
                          maxLines: 3,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
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
