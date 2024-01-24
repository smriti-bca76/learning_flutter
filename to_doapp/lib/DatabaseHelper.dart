import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_doapp/model/todo.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'todos';

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'todos.db');

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $tableName(
          id TEXT PRIMARY KEY,
          todoText TEXT,
          isDone INTEGER
        )
      ''');
    });
  }

  static Future<void> insert(ToDo todo) async {
    final Database db = await database;
    await db.insert(tableName, todo.toMap());
  }

  static Future<List<ToDo>> getAllTodos() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ToDo.fromMap(maps[i]);
    });
  }

  static Future<void> update(ToDo todo) async {
    final Database db = await database;
    await db
        .update(tableName, todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

  static Future<void> delete(String id) async {
    final Database db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
