
import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/View/widget/reaction_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemRecipes extends StatelessWidget {

  String abc = 'You can never have too many main course recipes, so give Sweet-N-Smoky Salmon With Ginger Mahogany Rice a try.'
      ' For 4.78 per serving, this recipe covers 31% of your daily requirements of vitamins and minerals. This recipe makes 4 servings with 732 calories, 41g of protein'
      ', and 19g of fat each. A mixture of soy sauce, chicken stock, mahogany rice, and a handful of other ingredients are all it takes to make this recipe so flavorful. 52 people '
      'have made this recipe and would make it again. It is a good option if you' 're following a gluten free, dairy free, fodmap friendly, and pescatarian diet. All things considered, we decided this recipe deserves a spoonacular score of 93%. This score is tremendous. Try Sweet-n-smoky Salmon With Ginger Mahogany Rice, Mahogany Broiled Chicken with Smoky Lime Sweet Potatoes and Cilantro Chimichurri, and Sweet & Smoky Salmon Kabobs for similar recipes.';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      height: size.height * 0.2,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container(
            child: Image.asset('$images/mask_group_2.jpg', fit: BoxFit.cover,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
          ), flex: 4,),
          Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Sweet-N-Smoky Salmon With Ginger Mahogany Rice',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13),),
                  ),

                  Expanded(
                    flex: 3,
                    child: Text('$abc', maxLines: 3,
                      style: TextStyle(fontSize: 10, color: Colors.grey),),

                  ),

                  Expanded(
                      flex: 2,
                      child: ReactionItem(number: 30, vegan: true)
                  ),
                ],),
              ))
        ],
      ),
    );
  }
}