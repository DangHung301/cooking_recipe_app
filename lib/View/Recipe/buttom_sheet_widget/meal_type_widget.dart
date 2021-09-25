import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/Helper/constan/item_buttom_sheet.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MealTypeWidget extends StatefulWidget {
  final RecipesViewModel recipesViewModel;

  MealTypeWidget({required this.recipesViewModel});

  @override
  _MealTypeWidgetState createState() => _MealTypeWidgetState();
}

class _MealTypeWidgetState extends State<MealTypeWidget> {
  @override
  Widget build(BuildContext context) {
    var _selectMeal = mealBoolList;
    var _lable = mealLableList;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)?.meal ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Wrap(
            spacing: 5,
            direction: Axis.horizontal,
            children: List<Widget>.generate(
                _lable.length,
                (index) => FilterChip(
                    label: Text(
                      '${_lable[index]}',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: _selectMeal[index] ? bgrAppBar : Colors.grey,
                          fontSize: 12),
                    ),
                    selectedColor: Color(0xFFE8DDFF),
                    backgroundColor: Color(0xFF0ffe3e3e3),
                    checkmarkColor: bgrAppBar,
                    selected: _selectMeal[index],
                    onSelected: (select) {
                      _selectMeal[index] = select;
                      if (_selectMeal[index]) {
                        widget.recipesViewModel.dietList.add(_lable[index]);
                      } else {
                        widget.recipesViewModel.dietList.remove(_lable[index]);
                      }
                      setState(() {});
                    })),
          )
        ],
      ),
    );
  }
}
