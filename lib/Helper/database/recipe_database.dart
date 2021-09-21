import 'package:cooking_recipe_app/Helper/database/recipe_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDatabase {
  static const DB_NAME = 'recipe.db';
  static const DB_VERSION = 1;
  static Database? _database;

  RecipeDatabase._privateConstructor();

  static final RecipeDatabase instance = RecipeDatabase._privateConstructor();

  Future<Database> get database async {
    if (_database != null)  _database;
    _database = await init();
    return _database!;
  }

  Future<Database> init() async {
    return await openDatabase(join(await getDatabasesPath(), DB_NAME),
        version: DB_VERSION, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    print(RecipeTable.CREATE_TABLE_QUERY);
    await db.execute(RecipeTable.CREATE_TABLE_QUERY);
  }
}
