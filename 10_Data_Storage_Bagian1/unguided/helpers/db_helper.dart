import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'students.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE students(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            nim TEXT,
            address TEXT,
            hobby TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertStudent(Student student) async {
    final db = await database;
    await db.insert('students', student.toMap());
  }

  Future<List<Student>> fetchStudents() async {
    final db = await database;
    final maps = await db.query('students');
    return List.generate(maps.length, (i) => Student.fromMap(maps[i]));
  }

  // Tambahkan metode delete di sini
  Future<void> deleteStudent(int id) async {
    final db = await database;
    await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
