import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

 final productId_helper = 'product_id';
 final productName = 'product_name';
 final productPrice = 'product_price';
 final productQuantity = 'product_quantity';
 final extraCheese = 'extra_cheese';
 final extraBaked = 'extra_baked';
 final extraSpice = 'extra_spice';
 final total_helper = 'total';


class Word{

  int pid;
  String pname;
  double pprice;
  int pquantity;
  String eCheese;
  String eBaked;
  String eSpice;
  double total;

  Word();

  Word.fromMap(Map<String, dynamic> map) {
    pid = map[productId_helper];
    pname = map[productName];
    pprice = map[productPrice];
    pquantity = map[productQuantity];
    eCheese = map[extraCheese];
    eBaked = map[extraBaked];
    eSpice = map[extraSpice];
    total = map[total_helper];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      productId_helper: pid,
      productName: pname,
      productPrice : pprice,
      productQuantity: pquantity,
      extraCheese: eCheese,
      extraBaked: eBaked,
      extraSpice: eSpice,
      total_helper : total,
    };
    return map;
  }
  Map<String, dynamic> toMapCount() {
    var map = <String, dynamic>{
      productQuantity: pquantity,
    };
    return map;
  }

  Map<String, dynamic> toMapExtras() {
    var map = <String, dynamic>{
      extraCheese: eCheese,
      extraBaked : eBaked,
      extraSpice : eSpice
    };
    return map;
  }

  Map<String, dynamic> toMapPrice() {
    var map = <String, dynamic>{
      productPrice: pprice,
    };
    return map;
  }
}

class DatabaseHelper{

  static final _dbName = 'my2Database.db';
  static final _dbVersion = 2;
  static final _tableName = 'myCart';




  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async{
    if(_database!=null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    db.execute(
        '''
        CREATE TABLE $_tableName(
        $productId_helper INT PRIMARY KEY,
        $productName TEXT NOT NULL, 
        $productPrice TEXT NOT NULL,
        $productQuantity TEXT NOT NULL, 
        $extraCheese TEXT NOT NULL, 
        $extraBaked TEXT NOT NULL, 
        $extraSpice TEXT NOT NULL,
        $total_helper TEXT NOT NULL)
        '''
    );
  }

  Future<int> insert(Word word) async{
   Database db = await instance.database;
   return await db.insert(_tableName, word.toMap());
  }

  Future<List<Map<String,dynamic>>> queryAll() async{
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  // Future<int> update(Map<String, dynamic> row) async{
  //   Database db = await instance.database;
  //   Word word = Word();
  //   int prodID = word.pid;
  //   return await db.update(_tableName, row,where: '$productId_helper = ?', whereArgs: [prodID]);
  // }
  Future<int> update(Word word, String pid) async {
    Database db = await instance.database;
    return await db.update(_tableName, word.toMapCount(),
        where: '$productId_helper = ?', whereArgs: [pid]).then((value){
    });
  }

  Future<int> updateExtras(Word word, String pid) async {
    Database db = await instance.database;
    return await db.update(_tableName, word.toMapExtras(),
        where: '$productId_helper = ?', whereArgs: [pid]).then((value){
    });
  }



  Future<int> delete(String pid) async{
    Database db = await instance.database;
    return await db.delete(_tableName,where: '$productId_helper = ?', whereArgs: [pid]);
  }

  // Future<List<Map>> queryOne(String pid) async{
  //   Database db = await instance.database;
  //   List<String> columnsToSelect = [productQuantity];
  //
  //   return await db.query(_tableName,columns: columnsToSelect ,where: '$productId_helper = ?', whereArgs: [pid]);
  //
  // }

  Future<String> queryOne(String pid) async{
    Database db = await instance.database;
    List<String> columnsToSelect = [productQuantity];

    List<Map> a =  await db.query(_tableName,columns: columnsToSelect ,where: '$productId_helper = ?', whereArgs: [pid]);
    var ans = a[0].values.toString();
    ans = ans.substring(1, ans.length - 1);
    return ans.toString();
  }

  Future<String> queryCheese(String pid) async{
    Database db = await instance.database;
    List<String> columnsToSelect = [extraCheese];

    List<Map> a =  await db.query(_tableName,columns: columnsToSelect ,where: '$productId_helper = ?', whereArgs: [pid]);
    var ans = a[0].values.toString();
    ans = ans.substring(1, ans.length - 1);
    return ans.toString();
  }

  Future<String> queryBaked(String pid) async{
    Database db = await instance.database;
    List<String> columnsToSelect = [extraBaked];

    List<Map> a =  await db.query(_tableName,columns: columnsToSelect ,where: '$productId_helper = ?', whereArgs: [pid]);
    var ans = a[0].values.toString();
    ans = ans.substring(1, ans.length - 1);
    return ans.toString();
  }

  Future<String> querySpice(String pid) async{
    Database db = await instance.database;
    List<String> columnsToSelect = [extraSpice];

    List<Map> a =  await db.query(_tableName,columns: columnsToSelect ,where: '$productId_helper = ?', whereArgs: [pid]);
    var ans = a[0].values.toString();
    ans = ans.substring(1, ans.length - 1);
    return ans.toString();
  }

  Future<String> queryPrice(String pid) async{
    Database db = await instance.database;
    List<String> columnsToSelect = [productPrice];

    List<Map> a =  await db.query(_tableName,columns: columnsToSelect ,where: '$productId_helper = ?', whereArgs: [pid]);
    var ans = a[0].values.toString();
    ans = ans.substring(1, ans.length - 1);
    print(ans);
    return ans.toString();
  }

  Future<int> getcount(String id) async {
    Database db = await instance.database;
    int count = Sqflite.firstIntValue(await db
        .rawQuery("SELECT COUNT(*) FROM $_tableName WHERE $productId_helper = $id"));
    return count;
  }

  Future<int> getCountForCart() async {
    Database db = await instance.database;
    int count = Sqflite.firstIntValue(await db
        .rawQuery("SELECT COUNT(*) FROM $_tableName WHERE $productQuantity >= 1"));
    print(count);
    return count;
  }

Future<List<Map>> queryForCart() async{
  Database db = await instance.database;
  List<String> columnsToSelect = [
    productId_helper,
    productName,
    productPrice,
    productQuantity,
    extraCheese,
    extraBaked,
    extraSpice,
  ];

  return await db.query(_tableName,columns: columnsToSelect ,where: '$productQuantity >= ?',whereArgs: [1]);

}

  Future<List<Map>> queryForExtras(String pid) async{
    Database db = await instance.database;
    List<String> columnsToSelect = [
      extraCheese,
      extraBaked,
      extraSpice,
    ];
    return await db.query(_tableName,columns: columnsToSelect ,where: '$productId_helper = ?',whereArgs: [pid]);

  }


}