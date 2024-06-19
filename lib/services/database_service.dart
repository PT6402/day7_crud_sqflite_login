import 'package:day7_crud_sqflite_login/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._inernal();

  factory DatabaseService() => _databaseService;
  DatabaseService._inernal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDatabase();

      return _database!;
    }
  }

  Future<Database> initDatabase() async {
    final getDirectory = await getDatabasesPath();
    String path = join(getDirectory, "UserDB.db");

    print('database path: ' + path);

    return openDatabase(path, onCreate: _onCreate, version: 1);
  }

  void _onCreate(Database db, int version) async {
    // create table
    String sql = """CREATE TABLE Users(
         id INTEGER PRIMARY KEY AUTOINCREMENT ,
         name TEXT , 
         password TEXT, 
         address TEXT, 
         isActive INTEGER
        )""";

    await db.execute(sql);

    // fill some records
    String sql1 =
        "INSERT INTO Users(name,password,address,isActive) VALUES('dat','123','VN',1)";
    String sql2 =
        "INSERT INTO Users(name,password,address,isActive) VALUES('phat','123','Campuchia',0)";
    String sql3 =
        "INSERT INTO Users(name,password,address,isActive) VALUES('quan','123','VN',0)";
    String sql4 =
        "INSERT INTO Users(name,password,address,isActive) VALUES('han','123','USA',1)";
    String sql5 =
        "INSERT INTO Users(name,password,address,isActive) VALUES('an','123','Thailand',1)";
    await db.execute(sql1);
    await db.execute(sql2);
    await db.execute(sql3);
    await db.execute(sql4);
    await db.execute(sql5);
  }

  //CRUD
  //Login method
  Future<bool> checkLogin(String name, String password) async {
    final db = await _databaseService.database;
    var data = await db.query("Users",
        where: 'name=? AND password=? AND isActive=1',
        whereArgs: [name, password]);

    print("check login:\n $data");
    return data.isNotEmpty;
  }

  //All users
  Future<List<UserModel>> getUsers() async {
    final db = await _databaseService.database;
    var data = await db.query("Users");
    List<UserModel> list =
        List.generate(data.length, (index) => UserModel.fromMap(data[index]));
    print('size: ${list.length}');
    return list;
  }

  //Update status
  Future<void> updateUser(UserModel user) async {
    final db = await _databaseService.database;
    var data = await db
        .update("Users", user.toMap(), where: 'id=?', whereArgs: [user.id]);
    print(data);
  }

  //Update status
  Future<void> deleteUser(int id) async {
    final db = await _databaseService.database;
    var data = await db.delete("Users", where: 'id=?', whereArgs: [id]);
    print(data);
  }

  //Add user
  Future<void> addUser(UserModel newUser) async {
    final db = await _databaseService.database;
    var data = await db.rawInsert(
        "INSERT INTO Users(name,password,address,isActive) VALUES('${newUser.name}','${newUser.password}','${newUser.address}',1)");
    print(" this is data ${data}");
  }
}
