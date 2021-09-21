import 'package:cooking_recipe_app/Helper/database/recipe_database.dart';
import 'package:cooking_recipe_app/Model/recipes.dart';
import 'package:sqflite/sqflite.dart';

class RecipeTable {
  static const TABLE_NAME = 'recipe';

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME (
      vegan INTEGER,
      aggregateLikes INTEGER,  
      id INTEGER PRIMARY KEY,
      title TEXT,
      readyInMinutes INTEGER,
      image TEXT,
      summary TEXT)
  ''';

  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> addRecipe(Recipes recipes) async {
    final Database db = await RecipeDatabase.instance.database;
    return db.insert(TABLE_NAME, recipes.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteRecipe(Recipes recipes) async {
    final Database db = await RecipeDatabase.instance.database;
    await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [recipes.id]);
  }

  Future<Recipes?> getRecipes(int id) async{
    final Database db = await RecipeDatabase.instance.database;
    List<Map<String, dynamic>> recipes = await db.query(TABLE_NAME, columns: null,where: 'id = ?', whereArgs: [id]);

    if(recipes.isNotEmpty){
      return Recipes.fromData(recipes.first);
    }else
      return null;
}

  Future<List<Recipes>> selectAll() async {
    final Database db = await RecipeDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

    return List.generate(maps.length, (index) =>
        Recipes(vegan: maps[index]['vegan'] == 1 ? true : false,
            aggregateLikes: maps[index]['aggregateLikes'],
            id: maps[index]['id'],
            title: maps[index]['title'],
            readyInMinutes: maps[index]['readyInMinutes'],
            image: maps[index]['image'],
            summary: maps[index]['summary']));
  }

  Future deleteAll() async {
    final Database db = await RecipeDatabase.instance.database;
    return db.delete(TABLE_NAME);
  }

  Future close() async {
    final Database db = await RecipeDatabase.instance.database;
    return db.close();
  }
}
