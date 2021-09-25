import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/Helper/constan/item_buttom_sheet.dart';
import 'package:cooking_recipe_app/ViewModel/recipes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltersBottonSheetWidget extends StatefulWidget {
  final RecipesViewModel recipesViewModel;

  FiltersBottonSheetWidget({required this.recipesViewModel});

  @override
  _FiltersBottonSheetWidgetState createState() =>
      _FiltersBottonSheetWidgetState();
}

class _FiltersBottonSheetWidgetState extends State<FiltersBottonSheetWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _lable = filterList;
    return Container(
      height: size.height * 0.3,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.filter_list),
                SizedBox(
                  width: 13,
                ),
                Text(
                  AppLocalizations.of(context)?.filter ?? '',
                  style:Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 19, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                spacing: 5,
                children: List.generate(
                    _lable.length,
                    (index) => ChoiceChip(
                          label: Text(
                            '${_lable[index]}',
                            style:Theme.of(context).textTheme.bodyText1?.copyWith( color: widget.recipesViewModel.isFilter==index ? bgrAppBar : Colors.grey,
                                fontSize: 12),
                          ),
                          selected: widget.recipesViewModel.isFilter==index,
                          selectedColor: Color(0xFFE8DDFF),
                          onSelected: ( select) {
                            widget.recipesViewModel.isFilter = select ? index : null;
                            widget.recipesViewModel.listFilter.add(_lable[index]);
                            print(_lable[index]);
                            setState(() {

                            });
                          },
                        ))),
          ),

          Expanded(
            flex: 1,
            child: InkWell(
                child: Container(
              alignment: Alignment.center,
              width: size.width * 0.88,
              height: 50,
              decoration: BoxDecoration(
                  color: bgrAppBar, borderRadius: BorderRadius.circular(5)),
              child: Text(
                AppLocalizations.of(context)?.apply ?? '',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
                   widget.recipesViewModel.fetchDataFilter();
                  Navigator.pop(context);
                  setState(() {

                  });
            },),
          ),
        ],
      ),
    );
  }
}
