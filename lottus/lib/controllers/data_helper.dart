import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class DataHelper {
  static final DataHelper _instance = DataHelper._internal();
  factory DataHelper() => _instance;
  static Database? _database;
  DataHelper._internal();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
    }
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
        "CREATE TABLE users(id TEXT PRIMARY KEY, name TEXT, email TEXT, photoUrl TEXT)",
        );
      },
    );
}

Future<void> insertUser(UserModel user) async {
  final db = await database;
  await db.insert(
    'users',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace, 
  );
}

Future<List<UserModel>> getUsers() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('users');
  return List.generate(maps.length, (i) {
    return UserModel(
    id: maps[i]['id'],
    name: maps[i]['name'],
    email: maps[i]['email'],
    photoUrl: maps[i]['photoUrl'],
    );
  });
}

Future<void> deleteUser(String id) async {
  final db = await database;
  await db.delete(
  'users',
  where: 'id = ?',
  whereArgs: [id],
  );
}
}