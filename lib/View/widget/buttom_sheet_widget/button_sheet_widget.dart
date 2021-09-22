import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/widget/buttom_sheet_widget/diet_type_widget.dart';
import 'package:cooking_recipe_app/View/widget/buttom_sheet_widget/meal_type_widget.dart';
import 'package:cooking_recipe_app/ViewModel/floating_buttom_viewmodel.dart';
import 'package:flutter/material.dart';

class ButtonSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.45,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: MealTypeWidget(
                  floatingButtonViewmodel: FloatingButtonViewmodel(),
                )),
            Expanded(
                flex: 3,
                child: DietTypeWidget(
                    floatingButtonViewmodel: FloatingButtonViewmodel())),
            InkWell(
                child: Container(
                  alignment: Alignment.center,
              width: size.width * 0.88,
              height: 50,
              decoration: BoxDecoration(
                  color: bgrAppBar, borderRadius: BorderRadius.circular(5)),
              child: Text(
                'APPLY',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
            )),
          ],
        ));
  }
}