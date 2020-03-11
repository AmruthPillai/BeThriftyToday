import 'package:bethriftytoday/data/currencies.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CurrencyProvider extends ChangeNotifier {
  List<Currency> currencies = [];
  Future<Database> database;

  CurrencyProvider() {
    this.initializeDB();
  }

  Future<void> initializeDB() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'currencies.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE currencies(id TEXT PRIMARY KEY, name TEXT, symbol TEXT)",
        );
        baseCurrencies.forEach((x) async {
          await db.insert(
            'currencies',
            x.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        });
      },
    );

    this.fetch();
  }

  Future<List<Currency>> fetch() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('currencies');
    currencies = maps.map((x) => Currency.fromJson(x)).toList();
    notifyListeners();

    return currencies;
  }

  Future insert(Currency currency) async {
    final Database db = await database;

    await db.insert(
      'currencies',
      currency.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await this.fetch();
  }

  Future update(Currency currency) async {
    final db = await database;

    await db.update(
      'currencies',
      currency.toJson(),
      where: "id = ?",
      whereArgs: [currency.id],
    );

    await this.fetch();
  }

  Future delete(Currency currency) async {
    final db = await database;

    await db.delete(
      'currencies',
      where: "id = ?",
      whereArgs: [currency.id],
    );

    await this.fetch();
  }

  Future reset() async {
    final db = await database;

    await db.delete('currencies');
    baseCurrencies.forEach((x) async {
      await db.insert(
        'currencies',
        x.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });

    await this.fetch();
  }
}
