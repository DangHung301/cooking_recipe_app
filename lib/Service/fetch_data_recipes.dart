import 'dart:convert';
import 'dart:core';
import 'package:cooking_recipe_app/Helper/constan/url.dart';
import 'package:http/http.dart' as http;
import 'package:cooking_recipe_app/Model/recipes.dart';

class FetchDataRecipes {

   static Future<List<Recipes>> fetchRecipes() async {
    String url = '$baseUrl/recipes/random?limitLicense=true&tags=&number=10&$apiKey';
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

  static Future<List<Recipes>> fetchSearch({String query = ''}) async{
     String url = '$baseUrl/recipes/complexSearch?addRecipeInformation=true&query=$query&number=5&$apiKey';
     List<Recipes> listSearch = [];
     final response = await http.get(Uri.parse(url));
     if(response.statusCode == 200){
       final mapResponse = json.decode(response.body) as Map<String, dynamic>;

       for(var i in mapResponse['results']){
         var info = Recipes.fromJson(i);
         listSearch.add(info);
       }

       return listSearch;
     }else{
       return throw Exception('Recipes error');
     }
  }
}