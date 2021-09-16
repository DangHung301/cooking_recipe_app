import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/Service/fetch_data_recipes.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel{
  BehaviorSubject<List<Recipes>> _subject = BehaviorSubject<List<Recipes>>();

  List<Recipes> listRecipes = <Recipes>[];

  void fetchRecipes() async {
    this.listRecipes = await FetchDataRecipes.fetchRecipes();
    _subject.sink.add(this.listRecipes);
  }

  BehaviorSubject<List<Recipes>> get subject => _subject;

  void dispose(){
    _subject.close();
  }
}
