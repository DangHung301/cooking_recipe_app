import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:cooking_recipe_app/Model/recipes.dart';

class FetchDataRecipes {

   static Future<List<Recipes>> fetchRecipes() async {
    String url = 'https://api.spoonacular.com/recipes/random?limitLicense=true&tags=&number=10&apiKey=9109f71b5da743febc8ae7c876ec5c1f';
    List<Recipes> listRecipes = [];
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final mapResponse = json.decode(response.body) as Map<String, dynamic>;

      for(var i in mapResponse['recipes']){
        final recipes = Recipes.fromJson(i);
        listRecipes.add(recipes);
      }

      return listRecipes;
    }else{
      return throw Exception('Recipes error');
    }
  }
}