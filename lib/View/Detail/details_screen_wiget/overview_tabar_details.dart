import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Model/overview_recipe.dart';
import 'package:cooking_recipe_app/ViewModel/overview_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appraisal_food.dart';

class OverviewTabarDetails extends StatefulWidget {
  final int recipesId;
  final OverviewViewModel overviewViewModel;

  OverviewTabarDetails(
      {required this.recipesId, required this.overviewViewModel});

  @override
  _OverviewTabarDetailsState createState() => _OverviewTabarDetailsState();
}

class _OverviewTabarDetailsState extends State<OverviewTabarDetails> {
  @override
  void initState() {
    super.initState();
    widget.overviewViewModel.getDataOverview(widget.recipesId);

  }

  @override
  void dispose() {
    super.dispose();
    widget.overviewViewModel.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(widget.recipesId);
    return StreamBuilder(
        stream: widget.overviewViewModel.subject.stream,
        builder: (context, AsyncSnapshot<OverviewRecipes> snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.hasError.toString()}');
          }

          final data = snapshot.data ??
              OverviewRecipes(
                  vegetarian: false,
                  vegan: false,
                  glutenFree: false,
                  dairyFree: false,
                  veryHealthy: false,
                  cheap: false,
                  aggregateLikes: 0,
                  readyInMinutes: 0,
                  id: -1,
                  image: '$images/no_data_recipes.png',
                  title: 'Khong co san pham',
                  summary: 'Khong co san pham');

          return snapshot.hasData
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('${snapshot.data?.image}'),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: Alignment(0.8, 0.7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _sub(
                                  icon: Icons.favorite,
                                  colorIcon: Colors.white,
                                  content: '${snapshot.data?.aggregateLikes}'),
                              SizedBox(
                                width: 10,
                              ),
                              _sub(
                                  icon: Icons.access_time,
                                  colorIcon: Colors.white,
                                  content: '${snapshot.data?.readyInMinutes}'),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      AppraisalFood(
                        aggregateLikes: data.aggregateLikes,
                        readyInMinutes: data.readyInMinutes,
                        title: data.title,
                        vegetarian: data.vegan,
                        vegan: data.vegan,
                        glutenFree: data.glutenFree,
                        dairyFree: data.dairyFree,
                        veryHealthy: data.veryHealthy,
                        cheap: data.cheap,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: size.width,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15, fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '${snapshot.data?.summary}',
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Widget _sub(
      {required IconData icon,
      required Color colorIcon,
      required String content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: colorIcon,
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          '$content',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: colorIcon, fontWeight: FontWeight.w400,),
        ),
      ],
    );
  }
}
