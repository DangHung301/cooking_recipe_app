import 'package:cooking_recipe_app/Helper/database/recipe_table.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:rxdart/rxdart.dart';

class EventRecipeViewmodel {
  RecipeTable _recipeTable = RecipeTable();
  BehaviorSubject<List<Recipes>> _subjectList = BehaviorSubject<List<Recipes>>();
  BehaviorSubject<Recipes> _subjectBool = BehaviorSubject<Recipes>();
  List<Recipes> listRecipe = [] ;

  init() async{
    listRecipe = await _recipeTable.selectAll();
    _subjectList.sink.add(listRecipe);
  }

   Future<bool> isFavorite(int id) async{
     Recipes? checkObj = await _recipeTable.getRecipes(id);

     if(checkObj == null){
       return false;
     }
     return true;
  }

  addRecipe(Recipes recipes) async {
    await _recipeTable.addRecipe(recipes);
    listRecipe.add(recipes);
    _subjectList.sink.add(listRecipe);
  }

  deleteRecipe(Recipes recipes) async {
    await _recipeTable.deleteRecipe(recipes);
    listRecipe.remove(recipes);
    _subjectList.sink.add(listRecipe);
  }

  deleteAll() async{
    await _recipeTable.deleteAll();
    listRecipe = await _recipeTable.selectAll();
    _subjectList.sink.add(listRecipe);
  }

  BehaviorSubject<List<Recipes>> get subjectList => _subjectList;

  dispose() {
    _subjectList.close();
    _subjectBool.close();
  }
}