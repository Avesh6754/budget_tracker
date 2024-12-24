import 'package:budget_tracker/DbHelper/dbHelper.dart';
import 'package:sqflite/sqflite.dart';

class UserHelper{
  UserHelper._();
  static UserHelper userHelper=UserHelper._();
Database? _database;
  Future<Database?> get database async => _database ??await Dbhelper.dbhelper.createDatabase();

Future<void> insertRecord({required String name,required String email,required String phone,required String age})
async {
  Database? db = await database;
  String query='''INSERT INTO user(name,email,phone,age) VALUES(?,?,?,?)''';
  List args=[name,email,phone,age];
  await db!.rawInsert(query,args);
}

}