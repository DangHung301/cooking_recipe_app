import 'package:cooking_recipe_app/Helper/config/remove_text_html.dart';
import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/Model/overview_recipe.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/appraisal_food.dart';
import 'package:cooking_recipe_app/ViewModel/overview_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverviewTabarDetails extends StatefulWidget {
  int recipesId;
  OverviewViewModel overviewViewModel;

  OverviewTabarDetails(
      {required this.recipesId, required this.overviewViewModel});

  @override
  _OverviewTabarDetailsState createState() => _OverviewTabarDetailsState();
}

class _OverviewTabarDetailsState extends State<OverviewTabarDetails> {
  @override
  void initState() {
    widget.overviewViewModel.getDataOverview(widget.recipesId);
    super.initState();
  }

  @override
  void dispose() {
    widget.overviewViewModel.dispose();
    super.dispose();
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
                        aggregateLikes: snapshot.data!.aggregateLikes,
                        readyInMinutes: snapshot.data!.readyInMinutes,
                        title: snapshot.data?.title,
                        vegetarian: snapshot.data!.vegan,
                        vegan: snapshot.data!.vegan,
                        glutenFree: snapshot.data!.glutenFree,
                        dairyFree: snapshot.data!.dairyFree,
                        veryHealthy: snapshot.data!.veryHealthy,
                        cheap: snapshot.data!.cheap,
                      ),
                      SizedBox(
                        height: 20,
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
                              style: TextStyle(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey.withOpacity(0.9)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              removeAllHtmlTags('${snapshot.data?.summary}'),
                              style: TextStyle(fontSize: 15),
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
          style: TextStyle(color: colorIcon, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
