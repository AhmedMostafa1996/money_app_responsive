import 'package:get/get.dart';
import 'package:ui_app/core/constants/constants.dart';
import 'package:ui_app/data/data_source/sqflite.dart';

abstract class HomeController extends GetxController{
String moneyNow();
deleteAllDatabase();
deleteOneRowINDatabase(int id);
}


class HomeControllerImpl extends HomeController{

  DatabaseHelper dbHelper = DatabaseHelper();


  @override
 String moneyNow() {
    if(ListData.total.isEmpty){
      return '0.0';
    }else{
      return ListData.total[0]['total'].toString();
    }
  }

  @override
  void onInit()async {
    await _createDatabase();
    super.onInit();
  }

  @override
  deleteAllDatabase()async {
    await dbHelper.deleteAllDatabase(ListData.information, ListData.total);
   await _createDatabase();
    update();
  }

  @override
  deleteOneRowINDatabase(int id)async {
    await dbHelper.deleteDatabase1(
      id: id,
      totalAmount: _getTotalInDelete(ListData.information),
    );
    await dbHelper.updateTotal(_getTotalInDelete(ListData.information));
    update();
  }

  _createDatabase()async{
    await dbHelper.createDatabase(
      ListData.information,
      ListData.total,
    );
    await dbHelper.getDataInformation(ListData.database).then((value) {
      ListData.information=value;
    });
    await dbHelper.getDataTotal(ListData.database).then((value) {
      ListData.total=value;
    });
    update();
  }

  double _getTotalInDelete(information){
    double totalMoneyEntry = 0.0;
    if (information.isEmpty) {
      return totalMoneyEntry;
    } else {
      for ( var i in information) {
        totalMoneyEntry += i['money'];
      }
      return totalMoneyEntry;
    }
  }

  void deleteRowInDatabase(int id,context)async {
    await dbHelper.deleteDatabase1(
      id: id,
      totalAmount: getTotalInDelete(ListData.information),
    );
    await dbHelper.updateTotal(getTotalInDelete(ListData.information));
    update();
  }

  double getTotalInDelete(information) {
    double totalMoneyEntry = 0.0;
    if (information.isEmpty) {
      return totalMoneyEntry;
    } else {
      for ( var i in information) {
        totalMoneyEntry += i['money'];
      }
      return totalMoneyEntry;
    }
  }


}