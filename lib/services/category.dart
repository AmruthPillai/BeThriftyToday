import 'package:bethriftytoday/data/categories.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  Future<Database> database;

  CategoryProvider() {
    this.initDB();
  }

  Future<void> initDB() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'categories.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE categories(id TEXT PRIMARY KEY, icon TEXT, name TEXT, type TEXT)",
        );
        baseIncomeCategories.forEach((x) async {
          await db.insert(
            'categories',
            x.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        });
        baseExpenseCategories.forEach((x) async {
          await db.insert(
            'categories',
            x.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        });
      },
    );

    this.fetch();
  }

  Future<List<Category>> fetch() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('categories');
    categories = maps.map((x) => Category.fromJson(x)).toList();
    notifyListeners();

    return categories;
  }

  Future insert(Category category) async {
    final Database db = await database;

    await db.insert(
      'categories',
      category.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await this.fetch();
  }

  Future update(Category category) async {
    final db = await database;

    await db.update(
      'categories',
      category.toJson(),
      where: "id = ?",
      whereArgs: [category.id],
    );

    await this.fetch();
  }

  Future delete(Category category) async {
    final db = await database;

    var res = await db.delete(
      'categories',
      where: "id = ?",
      whereArgs: [category.id],
    );

    print(res);

    await this.fetch();
  }

  Future deleteDB() async {
    deleteDatabase(join(await getDatabasesPath(), 'categories.db'));
  }
}
