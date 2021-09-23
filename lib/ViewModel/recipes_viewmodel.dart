import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/Service/fetch_data_recipes.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel {
  BehaviorSubject<List<Recipes>> _subjectListSearch =
      BehaviorSubject<List<Recipes>>();
  BehaviorSubject<List<Recipes>> _subjectlistDefaut =
      BehaviorSubject<List<Recipes>>();
  BehaviorSubject<String> subjectSearch = BehaviorSubject<String>();

  List<Recipes> listRecipes = <Recipes>[];
  List<Recipes> listSearch = <Recipes>[];

  Stream<String> get streamDebounceTime =>
      subjectSearch.stream.debounceTime(Duration(milliseconds: 500));

  RecipesViewModel(){
    streamDebounceTime.listen((event) async{
      this.listSearch = await FetchDataRecipes.fetchSearch(query: event);
      _subjectListSearch.add(this.listSearch);
    });
  }

  delaySearch(String query){
    subjectSearch.sink.add(query);
  }

  void fetchRecipes() async {
    this.listRecipes = await FetchDataRecipes.fetchRecipes();
    _subjectlistDefaut.sink.add(this.listRecipes);
  }


  BehaviorSubject<List<Recipes>> get subjectListSearch => _subjectListSearch;

  BehaviorSubject<List<Recipes>> get subjectlistDefaut => _subjectlistDefaut;

  void dispose(){
    _subjectListSearch.close();
    _subjectlistDefaut.close();
    subjectSearch.close();
  }
}
