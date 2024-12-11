import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  Dbhelper._();

  static Dbhelper dbhelper = Dbhelper._();

  Database? _database;

  Future<Database?> get database async => _database ?? await createDatabase();

  Future<Database?> createDatabase() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'budget.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String query =
            '''CREATE TABLE budget(id INTEGER PRIMARY KEY AUTOINCREMENT,amount REAL,isIncome INTEGER,date TEXT,category TEXT) ''';
          await db.execute(query);
      },
    );
    return _database;
  }
  Future<void> insertRecords(double amount,int isIncome,String date,String category)
  async {
    Database? db=await database;

    String query='''INSERT INTO budget(amount,isIncome,date,category) VALUES(?,?,?,?)''';

    List argument=[amount,isIncome,date,category];
    await db!.rawInsert(query,argument);

  }

  Future<List<Map<String, Object?>>> fetchRecords()
  async {
    Database? db=await database;

    String query='''SELECT * FROM budget''';
    return await db!.rawQuery(query);
  }
  Future<void> deleteRecord(int id)
  async {
    Database? db=await database;
    String query='''DELETE FROM budget WHERE id=?''';
    List argument=[id];
    await db!.rawDelete(query,argument);
  }

  Future<void> updateRecords(double amount,int isIncome,String date,String category,int id)
  async {
    Database? db=await database;
    String query='''UPDATE budget SET amount=?,isIncome=?,date=?,category=? WHERE id=?''';
    List argumnet=[amount,isIncome,date,category,id];
    await db!.rawUpdate(query,argumnet);

  }
}

