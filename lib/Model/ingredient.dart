import 'package:cooking_recipe_app/Helper/extension.dart';

class Ingredient {
  int id;
  String? image;
  String? name;
  String? original;

  Ingredient(
      {required this.id,
      required this.image,
      required this.name,
      required this.original});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
        id: json.intValue('id'),
        image: json.stringValue('image'),
        name: json.stringValue('name'),
        original: json.stringValue('original'));
  }
}
