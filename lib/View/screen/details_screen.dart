import 'dart:developer';
import 'dart:math';

import 'package:cooking_recipe_app/Helper/constan/color.dart';
import 'package:cooking_recipe_app/View/widget/custom_toast_dialog.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/ingredients_tabar_details.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/instruction_tabar_details.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/overview_tabar_details.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsScreen extends StatefulWidget {
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: bgrFoatingButton,
        title: Text(
          'Details',
        ),
        actions: [
          IconButton(
              onPressed: () {
                var fToast = FToast();
                fToast.init(context);
                fToast.showToast(child: ToastDialog(size, 'Recipe removed', 'OKEY', fToast));
              },
              icon: Icon(Icons.star_border))
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
          OverviewTabarDetails(),
          IngredientsTabarDetails(),
          InstructionTabarDetails(),
        ],
      ),
    );
  }
}
