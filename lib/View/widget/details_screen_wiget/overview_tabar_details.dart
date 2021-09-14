import 'package:cooking_recipe_app/Helper/constan/assets.dart';
import 'package:cooking_recipe_app/View/widget/details_screen_wiget/appraisal_food.dart';
import 'package:flutter/material.dart';

class OverviewTabarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var dataTest = <String, dynamic>{
      'aggregateLikes': 100,
      'readyInMinutes': 45,
      'title': 'Grilled Baked Brie with Shallots, Cranberries & Balsamic',
      'vegetarian': true,
      'vegan': false,
      'glutenFree': true,
      'dairyFree': false,
      'veryHealthy': false,
      'cheap': false,
      'summary':
          "Grilled Baked Brie with Shallots, Cranberries & Balsamic might be just the hor d'oeuvre you are searching for. Watching your figure? This gluten free, primal, and vegetarian recipe has <b>376 calories</b>, <b>8g of protein</b>, and <b>23g of fat</b> per serving. This recipe serves 1 and costs 1.7  per serving. A mixture of garlic, round of président brie, shallots, and a handful of other ingredients are all it takes to make this recipe so scrumptious. It can be enjoyed any time, but it is especially good for <b>The Fourth Of July</b>. 107 people were impressed by this recipe. From preparation to the plate, this recipe takes approximately <b>45 minutes</b>. All things considered, we decided this recipe <b>deserves a spoonacular score of 54%</b>. This score is pretty good. Try <a href=https://spoonacular.com/recipes/baked-brie-with-cranberries-and-cinnamon-624739>Baked Brie with Cranberries and Cinnamon</a>, <a href=https://spoonacular.com/recipes/baked-brie-bites-with-sugared-cranberries-403937>Baked Brie Bites With Sugared Cranberries</a>, and <a href=https://spoonacular.com/recipes/crescent-wrapped-baked-brie-with-apricots-cranberries-alm-124293>Crescent Wrapped Baked Brie With Apricots, Cranberries & Alm</a> for similar recipes.",
    };

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
        child: Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('$images/test.jpg'), fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment(0.8, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _sub(
                    icon: Icons.favorite,
                    colorIcon: Colors.white,
                    content: '100'),
                SizedBox(
                  width: 10,
                ),
                _sub(
                    icon: Icons.access_time,
                    colorIcon: Colors.white,
                    content: '100'),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
        AppraisalFood(
          size: size,
          aggregateLikes: dataTest['aggregateLikes'],
          readyInMinutes: dataTest['readyInMinutes'],
          title: dataTest['title'],
          vegetarian: dataTest['vegetarian'],
          vegan: dataTest['vegan'],
          glutenFree: dataTest['glutenFree'],
          dairyFree: dataTest['dairyFree'],
          veryHealthy: dataTest['veryHealthy'],
          cheap: dataTest['cheap'],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description', style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.grey.withOpacity(0.9)),),
              SizedBox(
                height: 15,
              ),
              Text('${dataTest['summary']}', style: TextStyle(fontSize: 15),)
            ],
          ),
        )
      ],
    ));
  }
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
