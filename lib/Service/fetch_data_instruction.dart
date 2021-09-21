import 'dart:convert';
import 'package:cooking_recipe_app/Model/instruction.dart';
import 'package:http/http.dart' as http;

class FetchDataInstruction{
 static Future<List<Instructions>> fetchDataInstruction(int id) async{
   String url = 'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=9109f71b5da743febc8ae7c876ec5c1f';
    List<Instructions> listInstruction = [];
   final response = await http.get(Uri.parse(url));

   if(response.statusCode==200){
     final mapResponse = json.decode(response.body) ;

     for(var i in mapResponse[0]['steps']){
       var infor = Instructions.fromJson(i);
       listInstruction.add(infor);
     }

     return listInstruction;
   }else{
     return throw Exception('Fails');
   }
 }
}