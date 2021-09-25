import 'package:cooking_recipe_app/Helper/extension.dart';

class OverviewRecipes {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  int aggregateLikes;
  int readyInMinutes;
  int id;
  String image;
  String title;
  String summary;

  OverviewRecipes(
      {required this.vegetarian,
      required this.vegan,
      required this.glutenFree,
      required this.dairyFree,
      required this.veryHealthy,
      required this.cheap,
      required this.aggregateLikes,
      required this.readyInMinutes,
      required this.id,
      required this.image,
      required this.title,
      required this.summary});

  factory OverviewRecipes.fromJson(Map<String, dynamic> json) {
    return OverviewRecipes(
        vegetarian: json.boolValue('vegetarian'),
        vegan: json.boolValue('vegan'),
        glutenFree: json.boolValue('glutenFree'),
        dairyFree: json.boolValue('dairyFree'),
        veryHealthy: json.boolValue('veryHealthy'),
        cheap: json.boolValue('vegetarian'),
        aggregateLikes: json.intValue('aggregateLikes'),
        readyInMinutes: json.intValue('readyInMinutes'),
        id: json.intValue('id'),
        image: json.stringValue('image'),
        title: json.stringValue('title'),
        summary: json.stringValue('summary').removeTextHtml());
  }
}
