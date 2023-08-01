import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import '../../presentation/router/routes.dart';

class DatabaseHelper {

  //Variable
  static String nameDatabase='daily.db';
  static String nameTableInformation='information';
  static String nameTableTotal='total';
   late Database database;


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
      database=value;
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
      context,
   })async{
      AppCubit cubit=AppCubit.get(context);
      await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO $nameTableInformation(nameDetails,date,money,icon,details)VALUES ("$nameDetails","$date","$money","$icon","$details")'
      ).then((value) {
        getDataInformation(database).then((value){
         cubit.information=value;
        });
      });
    });  // Insert للداتا
    await database.transaction((txn)async {
      database.rawUpdate('UPDATE $nameTableTotal SET total = ?', [totalAmount]).then(
              (value)async {
                getDataTotal(database).then((value) {
                  cubit.total=value;
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

   updateTotal(totalAmount,context)async{
     AppCubit cubit=AppCubit.get(context);
    await database.transaction((txn)async {
      database.rawUpdate('UPDATE $nameTableTotal SET total = ?', ['$totalAmount']);
    }); //Update للتوتال
    await getDataTotal(database).then((value) {
       cubit.total = value;
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

   deleteDatabase1({required int id, context,required totalAmount}) async {
     AppCubit cubit=AppCubit.get(context);
    await database.transaction((txn)  {
      return txn.delete(
        nameTableInformation,
        where: 'id = ?',
        whereArgs: [id],
      );
    });
   await getDataInformation(database).then((value) {
      cubit.information = value;
    });
   }

}
