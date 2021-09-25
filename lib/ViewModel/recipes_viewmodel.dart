
import 'dart:math';

import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/Service/fetch_data_meal_diet.dart';
import 'package:cooking_recipe_app/Service/fetch_data_recipes.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel {
  int? isFilter = 0;

  BehaviorSubject<List<Recipes>> _subjectListSearch =
      BehaviorSubject<List<Recipes>>();
  BehaviorSubject<List<Recipes>> _subjectlistDefaut =
      BehaviorSubject<List<Recipes>>();

  BehaviorSubject<String> subjectSearch = BehaviorSubject<String>();

  List<Recipes> listRecipes = <Recipes>[];
  List<Recipes> listSearch = <Recipes>[];
  List<String> listFilter = [];


  Stream<String> get streamDebounceTime =>
      subjectSearch.stream.debounceTime(Duration(milliseconds: 500));

  Set<String> mealList = {};
  Set<String> dietList = {};

  RecipesViewModel() {
    streamDebounceTime.listen((event) async {
      if (event == '' || event.isEmpty) {
        this.listSearch = await FetchDataRecipes.fetchRecipes();
        _subjectListSearch.add(this.listSearch);
      }
      this.listSearch = await FetchDataRecipes.fetchSearch(query: event);
      _subjectListSearch.add(this.listSearch);
    });
  }

  delaySearch(String query) {
    subjectSearch.sink.add(query);
  }

  void fetchDataType() async {
    String meal = mealList.join(',').trim();
    String diet = dietList.join(',').trim();
    this.listRecipes =
        await FetchDataMealDiet.fetchDataMealDiet(diet: diet, type: meal);
    _subjectlistDefaut.sink.add(this.listRecipes);

    if (meal.isEmpty && diet.isEmpty || meal == '' && diet == '') {
      this.listRecipes = await FetchDataRecipes.fetchRecipes();
      _subjectlistDefaut.sink.add(this.listRecipes);
    }
  }

  void fetchRecipes() async {
    this.listRecipes = await FetchDataRecipes.fetchRecipes();
    _subjectlistDefaut.sink.add(this.listRecipes);
    _subjectListSearch.sink.add(this.listRecipes);
  }

  void backHome() async{
    this.listRecipes = await _subjectlistDefaut.value;
    _subjectlistDefaut.sink.add(this.listRecipes);
  }

  void fetchDataFilter() async {
    String select = listFilter.last;
    listFilter.clear();
    switch (select) {
      case 'All':
        {
          this.listRecipes = await FetchDataRecipes.fetchRecipes();
          _subjectlistDefaut.sink.add(this.listRecipes);
        }
        break;
      case 'Newest':
      case 'Top Rated':
      case 'Most Popular':
      case 'Trendy':
      case 'Most Liked':
        {
          this.listRecipes = _subjectlistDefaut.value;
          this.listRecipes.sort((a, b) => a.aggregateLikes.compareTo(b.aggregateLikes));
          this.listRecipes.reversed;
          _subjectlistDefaut.sink.add(this.listRecipes);
        }
        break;
    }
  }

  BehaviorSubject<List<Recipes>> get subjectListSearch => _subjectListSearch;

  BehaviorSubject<List<Recipes>> get subjectlistDefaut => _subjectlistDefaut;

  void dispose() {
    _subjectListSearch.close();
    _subjectlistDefaut.close();
    subjectSearch.close();
  }
}
