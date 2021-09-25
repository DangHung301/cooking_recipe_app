import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/Helper/constan/item_buttom_sheet.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DietTypeWidget extends StatefulWidget {
  final RecipesViewModel recipesViewModel;

  DietTypeWidget({required this.recipesViewModel});

  @override
  _DietTypeWidgetState createState() => _DietTypeWidgetState();
}

class _DietTypeWidgetState extends State<DietTypeWidget> {
  @override
  Widget build(BuildContext context) {
    var _selectDiet = dietBoolList;
    var _labelDiet = dietLableList;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)?.diet ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 5,
            direction: Axis.horizontal,
            children: List<Widget>.generate(
                _labelDiet.length,
                (index) => FilterChip(
                    label: Text(
                      '${_labelDiet[index]}',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: _selectDiet[index] ? bgrAppBar : Colors.grey,
                          fontSize: 12),
                    ),
                    selectedColor: Color(0xFFE8DDFF),
                    backgroundColor: Color(0xFF0ffe3e3e3),
                    checkmarkColor: bgrAppBar,
                    selected: _selectDiet[index],
                    onSelected: (select) {
                      _selectDiet[index] = select;
                      if (_selectDiet[index]) {
                        widget.recipesViewModel.dietList.add(_labelDiet[index]);
                      } else {
                        widget.recipesViewModel.dietList
                            .remove(_labelDiet[index]);
                      }
                      setState(() {});
                    })),
          )
        ],
      ),
    );
  }
}
