//Database.dart

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'lottus.db');
    return await openDatabase(
      path,
      version: 1
    );
  }

/* Por si me equivoco
   Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'lottus.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: (Database db, int oldVersion, int newVersion) async{
        await db.execute('ALTER TABLE clientes ADD COLUMN password TEXT')
      }
    );
  } */

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categorias(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        examenes TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE marcas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE clientes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          password TEXT,
          correo_electronico TEXT,
          direccion TEXT,
          telefono TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE productos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          descripcion TEXT,
          precio REAL,
          stock INTEGER,
          categoria_id INTEGER,
          marca_id INTEGER,
          fecha_agregado DATE,
          FOREIGN KEY (categoria_id) REFERENCES categorias(id),
          FOREIGN KEY (marca_id) REFERENCES marcas(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE pedidos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          cliente_id INTEGER,
          fecha DATE,
          FOREIGN KEY (cliente_id) REFERENCES clientes(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE detalle_pedido (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          pedido_id INTEGER,
          producto_id INTEGER,
          cantidad INTEGER,
          precio_unitario REAL,
          FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
          FOREIGN KEY (producto_id) REFERENCES productos(id)
      )
    ''');
  }


  Future<void> insertTestData() async {
    var db = await database;
    await db.insert('clientes', {
      'nombre': 'Maria',
      'password': 'password',
      'correo_electronico': 'correo@gmail.com',
      'direccion': 'Paso de los Toros 1480',
      'telefono': '4427794571',
    });
  }

  Future<bool> authenticateUser(String nombre, String password) async{
    var db = await database;
    var result = await db.query(
      'clientes',
      where: 'nombre = ? AND password = ?',
      whereArgs: [nombre,password],
    );
    result result.isNotEmpty;
  }

  Future<void> testDatabase() async {
    var db = await database;
    print('Base de datos inicializada: $db');

    // Insertar datos de prueba
    await insertTestData();

    // Leer datos de prueba
    var result = await db.query('users');
    if (kDebugMode) {
      print('Datos de prueba insertados: $result');
    }
  }
}