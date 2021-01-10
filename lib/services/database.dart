import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  static final _dbName = 'list member';
  static final _version = 1;

  static final tableName = 'users';

  static final columnID = '_id';
  static final columnName = 'name';
  static final columnPhoneNumber = 'phone number';
  static final columnGender = 'gender';
  static final columnDOB = 'date of birth';
  static final columnAvatarUrl = 'avatar URL';
  static final columnDescription = 'description';

  DBProvider._privateConstructor();
  static final DBProvider instance = DBProvider._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // init database (opens database if existed, if not create it)
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _dbName);
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  // create a table (using SQL)
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
      $columnID INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnGender TEXT NOT NULL,
      $columnDOB TEXT NOT NULL,
      $columnDescription TEXT,
      $columnPhoneNumber TEXT
    )
    ''');
  }

  // insert a new user
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  // return a list of user
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  // return number of row in db
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnID];
    return await db
        .update(tableName, row, where: '$columnID = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$columnID = ?', whereArgs: [id]);
  }
}
