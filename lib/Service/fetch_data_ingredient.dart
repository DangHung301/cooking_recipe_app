import 'dart:convert';
import 'package:cooking_recipe_app/Helper/constan/url.dart';
import 'package:http/http.dart' as http;
import 'package:cooking_recipe_app/Model/ingredient.dart';

class FetchDataIngredient {
  static Future<List<Ingredient>> fetchDataIngredient(int id) async{
    String url = 'https://api.spoonacular.com/recipes/$id/information?$apiKey';
    List<Ingredient> listIngredient = [];
    final response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final mapResponse = json.decode(response.body);

      for(var i in mapResponse['extendedIngredients']){
        var info = Ingredient.fromJson(i);
        listIngredient.add(info);
      }

      return listIngredient;
    }else{
      return throw Exception('Fails');
    }
  }
}