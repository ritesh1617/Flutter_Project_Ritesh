import 'dart:async';
import 'package:database/DataBaseHelper/word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static final _databaseName = "dictionary.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE words(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT,
        meaning TEXT
      )
      ''');
  }

  Future<int> insert(Word word) async {
    Database db = await instance.database;
    return await db.insert('words', word.toMap());
  }

  Future<List<Word>> queryAllWords() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('words');
    return List.generate(maps.length, (i) {
      return Word(
        id: maps[i]['id'],
        word: maps[i]['word'],
        meaning: maps[i]['meaning'],
      );
    });
  }

  Future<int> update(Word word) async {
    Database db = await instance.database;
    return await db.update(
      'words',
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'words',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
