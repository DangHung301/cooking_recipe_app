import 'dart:developer';

import 'package:cooking_recipe_app/Helper/database/recipe_table.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:cooking_recipe_app/Service/fetch_data_meal_diet.dart';
import 'package:cooking_recipe_app/Service/fetch_data_recipes.dart';
import 'package:cooking_recipe_app/ViewModel/favorite_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel {
  int? isFilter = 0;

  BehaviorSubject<List<Recipes>> _subjectListSearch =
      BehaviorSubject<List<Recipes>>();
  BehaviorSubject<List<Recipes>> _subjectlistDefaut =
      BehaviorSubject<List<Recipes>>();

  BehaviorSubject<String> subjectSearch = BehaviorSubject<String>();
  RecipeTable _recipeTable = RecipeTable();

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
    this.listSearch = await FetchDataRecipes.fetchRecipes();
    _subjectListSearch.add(this.listSearch);
  }

  Future<List<Recipes>> sortList() async{
    List<Recipes> listSort;
    listSort = await _recipeTable.selectAll();

    listSort.sort((a, b) => a.aggregateLikes.compareTo(b.aggregateLikes));
    listSort.reversed;

    return listSort;
  }

  void fetchDataFilter() async {
    switch ('Trendy') {
      case 'All':
        {
          print('1');
          this.listRecipes = await FetchDataRecipes.fetchRecipes();
          _subjectlistDefaut.sink.add(this.listRecipes);
          log('1');
        }
        break;
      case 'Newest':
      case 'Top Rated':
      case 'Most Popular':
      case 'Trendy':
      case 'Most Liked':
        {
          listRecipes.clear();
          this.listRecipes = await sortList();
          for(var i in listRecipes){
            print(i.aggregateLikes);
          }
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

  // String addSelected(String lable) {
  //   listFilter.clear();
  //   listFilter.add(lable);
  //   return listFilter[0];
  // }
}
