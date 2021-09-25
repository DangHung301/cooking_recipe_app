import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'diet_type_widget.dart';
import 'meal_type_widget.dart';

class ButtonSheetWidget extends StatefulWidget {
  final RecipesViewModel recipesViewModel;

  ButtonSheetWidget({required this.recipesViewModel});

  @override
  _ButtonSheetWidgetState createState() => _ButtonSheetWidgetState();
}

class _ButtonSheetWidgetState extends State<ButtonSheetWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.45,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: MealTypeWidget(
                    recipesViewModel: widget.recipesViewModel
                )),
            Expanded(
                flex: 3,
                child: DietTypeWidget(recipesViewModel: widget.recipesViewModel,
                )),
            Align(
              alignment: Alignment(0,0.75),
              child: InkWell(
                  child: Container(
                alignment: Alignment.center,
                width: size.width * 0.88,
                height: 50,
                decoration: BoxDecoration(
                    color: bgrAppBar, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  AppLocalizations.of(context)?.apply ?? '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),

              onTap: (){
                    widget.recipesViewModel.fetchDataType();
                    Navigator.pop(context);

              },),
            ),
          ],
        ));
  }
}
