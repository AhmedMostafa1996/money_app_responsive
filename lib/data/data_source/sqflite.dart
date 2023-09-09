import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ui_app/core/constants/constants.dart';
import '../../core/constants/routes.dart';

class DatabaseHelper {

  //Variable
  static String nameDatabase='daily.db';
  static String nameTableInformation='information';
  static String nameTableTotal='total';


  //Create

   createDatabase(information,total) async {
     await openDatabase(
        nameDatabase,
        version: 1,
        onCreate: (database, version)  async {
         await database.execute(
              'CREATE TABLE $nameTableInformation( id INTEGER PRIMARY KEY, nameDetails TEXT,date TEXT,money DOUBLE,icon TEXT,details TEXT)'
          ).then((value) {
         });
         await database.execute(
            'CREATE TABLE $nameTableTotal(total DOUBLE)',
          ).then((value) {
         });
         await database.transaction((txn) {
           return txn.rawInsert('INSERT INTO $nameTableTotal(total)VALUES(${0.0})');
         }).then((value) {
           getDataTotal(database).then((value) {
             total=value;
           });
         });
        },
        onOpen: (database)async {
        }).then((value) {
       ListData.database=value;
     });
  }

  //Insert

    insertDatabase({
    required String nameDetails,
    required String date,
    required double money,
    required String icon,
    required String details,
    required double totalAmount,
   })async{
      await ListData.database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO $nameTableInformation(nameDetails,date,money,icon,details)VALUES ("$nameDetails","$date","$money","$icon","$details")'
      ).then((value) {
        getDataInformation(ListData.database).then((value){
         ListData.information=value;
        });
      });
    });  // Insert للداتا
    await ListData.database.transaction((txn)async {
      ListData.database.rawUpdate('UPDATE $nameTableTotal SET total = ?', [totalAmount]).then(
              (value)async {
                getDataTotal(ListData.database).then((value) {
                  ListData.total=value;
                  Get.offAllNamed(AppRoutes.home);
                });
              });
    }); //Update للتوتال
   }

   //GET DATA INFORMATION

   Future<List<Map>>getDataInformation(database)async{
    return await database.rawQuery("SELECT * FROM $nameTableInformation");
  }

  //GET DATA TOTAL MONEY

   Future<List<Map>>getDataTotal(database)async{
    return await database.rawQuery("SELECT * FROM $nameTableTotal");
  }

  //UPDATE DATABASE

   updateTotal(totalAmount)async{
    await ListData.database.transaction((txn)async {
      ListData.database.rawUpdate('UPDATE $nameTableTotal SET total = ?', ['$totalAmount']);
    }); //Update للتوتال
    await getDataTotal(ListData.database).then((value) {
       ListData.total = value;
     });

  }

  //DELETE ALL DATABASE

   deleteAllDatabase(information,total)async {
     var databasesPath = await getDatabasesPath();
     String path = join(databasesPath, nameDatabase);
     deleteDatabase(path);
     createDatabase(information, total);
   }

  //DELETE ROW IN DATABASE

   deleteDatabase1({required int id,required totalAmount}) async {
    await ListData.database.transaction((txn)  {
      return txn.delete(
        nameTableInformation,
        where: 'id = ?',
        whereArgs: [id],
      );
    });
   await getDataInformation(ListData.database).then((value) {
     ListData.information = value;
    });
   }

}
