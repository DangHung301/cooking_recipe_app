import 'package:cooking_recipe_app/Helper/extension.dart';

class Recipes {
  bool vegan;
  int aggregateLikes;
  int id;
  String title;
  int readyInMinutes;
  String? image;
  String summary;

  Recipes(
      {required this.vegan, required this.aggregateLikes, required this.id, required this.title,
        required this.readyInMinutes, this.image, required this.summary});

  factory Recipes.fromJson(Map<String, dynamic> json){
    return Recipes(
      vegan: json.boolValue('vegan'),
      aggregateLikes: json.intValue('aggregateLikes'),
      id: json.intValue('id'),
      title: json.stringValue('title'),
      readyInMinutes: json.intValue('readyInMinutes'),
      image: json.stringValue('image'),
      summary: json.stringValue('summary'),
    );
  }

  factory Recipes.fromData(Map<String, dynamic> json){
    return Recipes(
      vegan: json.intValue('vegan').intIntoBool(),
      aggregateLikes: json.intValue('aggregateLikes'),
      id: json.intValue('id'),
      title: json.stringValue('title'),
      readyInMinutes: json.intValue('readyInMinutes'),
      image: json.stringValue('image'),
      summary: json.stringValue('summary'),
    );
  }

   Map<String, dynamic> toMap() {
    return {
      'vegan': vegan.boolIntoInt(),
      'aggregateLikes': aggregateLikes,
      'id': id,
      'title': title,
      'readyInMinutes': readyInMinutes,
      'image': image,
      'summary': summary,
    };
  }
}