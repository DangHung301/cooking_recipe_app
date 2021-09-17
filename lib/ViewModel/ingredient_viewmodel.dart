import 'package:cooking_recipe_app/Model/ingredient.dart';
import 'package:cooking_recipe_app/Service/fetch_data_ingredient.dart';
import 'package:rxdart/rxdart.dart';

class IngredientViewModel {
  BehaviorSubject<List<Ingredient>> _subject = BehaviorSubject<List<Ingredient>>();

  List<Ingredient> listIngredient = [];

  getIngredient(int id) async{
    this.listIngredient = (await FetchDataIngredient.fetchDataIngredient(id)).cast<Ingredient>();
    _subject.sink.add(this.listIngredient);
  }

  BehaviorSubject<List<Ingredient>> get subject => _subject;

  dispose(){
    _subject.close();
  }
}