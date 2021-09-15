import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/widget/recipes_screen_widget/reaction_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget FoodItem(List<Recipes>? listRecipes, Size size) {
  return ListView.builder(
      itemCount: listRecipes?.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10)),
          height: size.height * 0.2,
          margin: EdgeInsets.all(10),
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
                          '${listRecipes?[index].image}',
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
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            '${listRecipes?[index].title}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '${listRecipes?[index].summary}',
                            maxLines: 3,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ReactionItem(
                            aggregateLikes: listRecipes?[index].aggregateLikes,
                            readyInMinutes: listRecipes?[index].readyInMinutes,
                            vegan: listRecipes![index].vegan,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        );
      });
}
