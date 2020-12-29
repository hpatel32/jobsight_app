import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final _databaseName = "jobsight.db";
  static final _databaseVersion = 1;

  static final table = 'login';

  static final columnId = 'id';
  static final columnUser = 'username';
  static final columnCompany = 'company';
  static final columnPass = 'password';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnUser FLOAT NOT NULL
            $columnCompany FLOAT NOT NULL
            $columnPass FLOAT NOT NULL
          )
          ''');
  }

}