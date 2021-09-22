import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/ViewModel/floating_buttom_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealTypeWidget extends StatefulWidget {
  final FloatingButtonViewmodel floatingButtonViewmodel;

  MealTypeWidget({required this.floatingButtonViewmodel});

  @override
  _MealTypeWidgetState createState() => _MealTypeWidgetState();
}

class _MealTypeWidgetState extends State<MealTypeWidget> {
  @override
  Widget build(BuildContext context) {
    var _selectMeal = widget.floatingButtonViewmodel.mealBoolList;
    var _lable = widget.floatingButtonViewmodel.mealLableList;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meal type',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Wrap(
            spacing: 5,
            direction: Axis.horizontal,
            children: List<Widget>.generate(
                _lable.length,
                (index) => FilterChip(
                    label: Text(
                      '${_lable[index]}',
                      style: TextStyle(
                          color: _selectMeal[index] ? bgrAppBar : Colors.grey,
                          fontSize: 12),
                    ),
                    selectedColor: Color(0xFFE8DDFF),
                    backgroundColor: Color(0xFF0ffe3e3e3),
                    checkmarkColor: bgrAppBar,
                    selected: _selectMeal[index],
                    onSelected: (select) {
                      _selectMeal[index] = select;
                      setState(() {});
                    })),
          )
        ],
      ),
    );
  }
}
