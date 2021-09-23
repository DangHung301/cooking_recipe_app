import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/widget/custom_toast_dialog.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/ingredients_tabar_details.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/instruction_tabar_details.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/overview_tabar_details.dart';
import 'package:cooking_recipe_app/ViewModel/event_recipe_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/ingredient_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/instructions_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/overview_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsScreen extends StatefulWidget {
  final Recipes recipes;
  final EventRecipeViewmodel eventRecipeViewmodel;
  late final bool checkObj;
  DetailsScreen({required this.recipes, required this.eventRecipeViewmodel, required this.checkObj});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    widget.eventRecipeViewmodel.isFavorite(widget.recipes.id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.recipes.id);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        },),
        title: Text(
          'Details',
        ),
        actions: [
          IconButton(
            onPressed: () {
              var fToast = FToast();
              fToast.init(context);
              setState(() {
                widget.checkObj = !widget.checkObj;
              });

              if(widget.checkObj){
                widget.eventRecipeViewmodel.addRecipe(widget.recipes);
                widget.eventRecipeViewmodel.init();
                fToast.showToast(child: toastDialog(size, 'Recipe ADD', 'OKEY', fToast));
              }else{
                widget.eventRecipeViewmodel.deleteRecipe(widget.recipes);
                widget.eventRecipeViewmodel.init();
                fToast.showToast(child: toastDialog(size, 'Recipe REMOVE', 'OKE', fToast));
              }

            },
            icon: Icon(Icons.star), color: widget.checkObj ? Colors.amber : Colors.grey,)
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Text('Overview'),
            ),
            Tab(
              child: Text('Ingredient'),
            ),
            Tab(
              child: Text('Instructions'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OverviewTabarDetails(recipesId: widget.recipes.id, overviewViewModel: OverviewViewModel(),),
          IngredientsTabarDetails(id: widget.recipes.id, ingredientViewModel: IngredientViewModel(),),
          InstructionTabarDetails(id: widget.recipes.id, instructionViewmodel: InstructionViewmodel(),),
        ],
      ),
    );
  }
}