import 'package:cooking_recipe_app/Model/overview_recipe.dart';
import 'package:cooking_recipe_app/Service/fetch_data_overview.dart';
import 'package:rxdart/rxdart.dart';

class OverviewViewModel{
  BehaviorSubject<OverviewRecipes> _subject = BehaviorSubject<OverviewRecipes>();

  late OverviewRecipes _overviewRecipes;
  getDataOverview(int id) async{
    this._overviewRecipes = await FetchDataOveriew.getDataOverview(id);
    _subject.sink.add(this._overviewRecipes);
  }

  BehaviorSubject<OverviewRecipes> get subject => _subject;

  void dispose(){
    _subject.close();
  }
}
