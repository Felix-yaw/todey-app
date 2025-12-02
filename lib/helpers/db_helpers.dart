import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todoey.db');

    return await openDatabase(path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(''' 
      CREATE TABLE tasks(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      isDone INTEGER)''');

    });

  }

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<int> insertTask(String name) async {
    final db = await database;
    return await db.insert('tasks', {'name': name, 'isDone':0});
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return await db.query('tasks');
  }

  Future<int> updateTask(int id, String name, int isDone) async {
    final db = await database;
    return await db.update(
      'tasks',
      {'name': name, 'isDone': isDone},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }


}