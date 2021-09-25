import 'dart:convert';

import 'package:cooking_recipe_app/Helper/constan/url.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:http/http.dart' as http;

class FetchDataMealDiet {
  static Future<List<Recipes>> fetchDataMealDiet(
      {String diet = '', String type = ''}) async {
    String url = '$baseUrl/recipes/complexSearch?number=10&type=${type}&diet=${diet}&addRecipeInformation=true&$apiKey';
    List<Recipes> listRecipes = [];
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final maps = json.decode(response.body) as Map<String, dynamic>;

      for(var i in maps['results']){
        var infor = Recipes.fromJson(i);
        listRecipes.add(infor);
      }

      return listRecipes;
    }else
      return throw Exception('filter error');
  }
}