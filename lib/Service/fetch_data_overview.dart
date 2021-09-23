import 'dart:convert';

import 'package:cooking_recipe_app/Helper/constan/url.dart';
import 'package:cooking_recipe_app/Model/overview_recipe.dart';
import 'package:http/http.dart' as http;
class FetchDataOveriew{
  static Future<OverviewRecipes> getDataOverview(int id) async{
    String url = 'https://api.spoonacular.com/recipes/$id/information?$apiKey';

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){

      return OverviewRecipes.fromJson(json.decode(response.body));
    }else{
      return throw Exception('Fails');
    }
  }
}