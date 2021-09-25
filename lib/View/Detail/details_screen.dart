import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/View/Detail/details_screen_wiget/ingredients_tabar_details.dart';
import 'package:cooking_recipe_app/View/Detail/details_screen_wiget/instruction_tabar_details.dart';
import 'package:cooking_recipe_app/View/Detail/details_screen_wiget/overview_tabar_details.dart';
import 'package:cooking_recipe_app/View/widget/custom_toast_dialog.dart';
import 'package:cooking_recipe_app/ViewModel/favorite_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/ingredient_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/instructions_viewmodel.dart';
import 'package:cooking_recipe_app/ViewModel/overview_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsScreen extends StatefulWidget {
  final Recipes recipes;
  final EventRecipeViewmodel eventRecipeViewmodel;
  bool checkObj;

  DetailsScreen(
      {required this.recipes,
      required this.eventRecipeViewmodel,
      required this.checkObj});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)?.recipe ?? '',
        ),
        actions: [
          IconButton(
            onPressed: () {
              var fToast = FToast();
              fToast.init(context);
              setState(() {
                widget.checkObj = !widget.checkObj;
              });

              if (widget.checkObj) {
                widget.eventRecipeViewmodel.addRecipe(widget.recipes);
                widget.eventRecipeViewmodel.init();
                fToast.showToast(
                    child: toastDialog(
                        size,
                        AppLocalizations.of(context)?.recipe_add ?? '',
                        AppLocalizations.of(context)?.okey ?? '',
                        fToast));
              } else {
                widget.eventRecipeViewmodel.deleteRecipe(widget.recipes);
                widget.eventRecipeViewmodel.init();
                fToast.showToast(
                    child: toastDialog(
                        size,
                        AppLocalizations.of(context)?.recipe_remove ?? '',
                        AppLocalizations.of(context)?.okey ?? '',
                        fToast));
              }
            },
            icon: Icon(Icons.star),
            color: widget.checkObj ? Colors.amber : Colors.grey,
          )
        ],

        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Text(AppLocalizations.of(context)?.overview ?? ''),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)?.ingredient ?? ''),
            ),
            Tab(
              child: Text(AppLocalizations.of(context)?.instructions ?? ''),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OverviewTabarDetails(
            recipesId: widget.recipes.id,
            overviewViewModel: OverviewViewModel(),
          ),
          IngredientsTabarDetails(
            id: widget.recipes.id,
            ingredientViewModel: IngredientViewModel(),
          ),
          InstructionTabarDetails(
            id: widget.recipes.id,
            instructionViewmodel: InstructionViewmodel(),
          ),
        ],
      ),
    );
  }
}
