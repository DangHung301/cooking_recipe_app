import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/ViewModel/floating_buttom_viewmodel.dart';
import 'package:flutter/material.dart';

class DietTypeWidget extends StatefulWidget{
  final FloatingButtonViewmodel floatingButtonViewmodel;

  DietTypeWidget({required this.floatingButtonViewmodel});

  @override
  _DietTypeWidgetState createState() => _DietTypeWidgetState();
}

class _DietTypeWidgetState extends State<DietTypeWidget> {
  @override
  Widget build(BuildContext context) {
    var _selectDiet = widget.floatingButtonViewmodel.dietBoolList;
    var _labelDiet = widget.floatingButtonViewmodel.dietLableList;
   return SingleChildScrollView(
     scrollDirection: Axis.vertical,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'Diet type',
           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
         ),
         SizedBox(height: 10,),

         Wrap(
           spacing: 5,
           direction: Axis.horizontal,
           children: List<Widget>.generate(
               _labelDiet.length,
                   (index) => FilterChip(
                   label: Text(
                     '${_labelDiet[index]}',
                     style: TextStyle(
                         color: _selectDiet[index] ? bgrAppBar : Colors.grey,
                         fontSize: 12),
                   ),
                   selectedColor: Color(0xFFE8DDFF),
                   backgroundColor: Color(0xFF0ffe3e3e3),
                   checkmarkColor: bgrAppBar,
                   selected: _selectDiet[index],
                   onSelected: (select) {
                     _selectDiet[index] = select;
                     setState(() {});
                   })),
         )
       ],
     ),
   );
  }
}