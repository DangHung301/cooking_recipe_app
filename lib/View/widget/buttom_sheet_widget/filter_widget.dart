import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/ViewModel/floating_buttom_viewmodel.dart';
import 'package:flutter/material.dart';

class FiltersBottonSheetWidget extends StatefulWidget {
  final FloatingButtonViewmodel floatingButtonViewmodel;

  FiltersBottonSheetWidget({required this.floatingButtonViewmodel});

  @override
  _FiltersBottonSheetWidgetState createState() =>
      _FiltersBottonSheetWidgetState();
}

class _FiltersBottonSheetWidgetState extends State<FiltersBottonSheetWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _lable = widget.floatingButtonViewmodel.filterList;
    var _boolList = widget.floatingButtonViewmodel.filterBoolList;
    return Container(
      height: size.height * 0.3,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.filter_list),
              SizedBox(
                width: 13,
              ),
              Text(
                'Filter',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
              )
            ],
          ),

          SizedBox(height: 15,),

          Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              spacing: 5,
              children: List.generate(
                  _lable.length,
                  (index) => ChoiceChip(
                        label: Text('${_lable[index]}'),
                        selected: _boolList[index],
                        onSelected: (select) {
                          _boolList[index] = select;
                          setState(() {});
                        },
                      ))),

          SizedBox(height: 20,),

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
      ),
    );
  }
}
