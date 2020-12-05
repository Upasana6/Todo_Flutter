import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // database name and version
  static final _databaseName = "todo.db";
  static final _databaseVersion = 1;

  // table name
  static final table = "data";

  //column name
  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnDescription = 'description';
  static final columnIsDone = 'isDone';

  // database
  static Database _database;

  // constructor to call same instance
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Database called
  Future<Database> get database async {
    if (_database != null) return _database;

    // don't exist
    _database = await _initDatabase();
    return _database;
  }

  // function to intialize and return database
  _initDatabase() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // create database
  Future _onCreate(Database db, int version) async {
    // create table
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT,
        $columnDescription TEXT,
        $columnIsDone BIT
      )
    ''');
  }

  // insert data
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // delete data
  Future<int> delete(int id) async {
    Database db = await instance.database;
    var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
    return res;
  }

  // update data
  Future<int> update(String newTitle, String newDescription, int id) async {
    Database db = await instance.database;
    return await db.update(
      table,
      {'title': newTitle, 'description': newDescription},
      where: 'id = ?',
      whereArgs: [id],
    );
    // return await db.rawUpdate(
    //   '''
    //   UPDATE $table
    //   SET title = $newTitle, description = $newDescription
    //   WHERE id = $id
    // ''',
    // );
  }

  Future<int> toggleIsDone({bool isDone, int id}) async {
    Database db = await instance.database;
    int temp = isDone ? 1 : 0;
    return await db.rawUpdate('''
      UPDATE $table
      SET isDone = $temp
      WHERE id = $id
    ''');
  }

  // query data
  Future<List<Map<String, dynamic>>> query() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}
