
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = 'parks';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!; }

  Future<Database> _initDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(, 'parks.db'),
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE $tableName (parking_code TEXT PRIMA
        RY
         KEY, parkingName Text, lat REAL, lng REAL)",);
        }, version: 1);
        return database;
        
  
}