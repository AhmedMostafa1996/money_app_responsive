import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/state.dart';
import 'package:ui_app/money_elhrameen_app/domain/database/sqflite.dart';
import 'package:ui_app/money_elhrameen_app/domain/model/models.dart';

class AppCubit extends Cubit<AppState> {
  //Constructor
  AppCubit() : super(InitializeState());

  //Object
  static AppCubit get(context) => BlocProvider.of(context);

  //Variable

  DatabaseHelper dbHelper = DatabaseHelper();
  Database? database;
  Color colorMoney = Colors.white;
  double? money;
  double totalLast = 0.0;

  //List

  List<Map> information = [];
  List<Map> total = [];

  //Method Database
   createDatabase() async {
    await dbHelper.createDatabase(
      information,
      total,
    );
    await dbHelper.getDataInformation(dbHelper.database).then((value) {
      information=value;
    });
    await dbHelper.getDataTotal(dbHelper.database).then((value) {
      total=value;
    });
    emit(CreateDatabaseState());
  }

   insertAllDatabase(WalletModel walletModel,context)async {
    await dbHelper.insertDatabase(
        nameDetails: walletModel.nameDetails,
        date: walletModel.date,
        money: walletModel.money,
        icon: walletModel.icon,
        details: walletModel.details,
        totalAmount: walletModel.total,
      context: context,
    );
    emit(InsertAllDatabaseState());
   }

  void deleteAllDatabase()async {
   await dbHelper.deleteAllDatabase(information, total);
    createDatabase();
    emit(DeleteDatabaseState());
  }

  void deleteRowInDatabase(int id,context)async {
   await dbHelper.deleteDatabase1(
        id: id,
        context: context,
        totalAmount: getTotalInDelete(information),
    );
   await dbHelper.updateTotal(getTotalInDelete(information), context);
    emit(DeleteRowDatabaseState());
  }

  //Method

  double getTotal(priceController,n) {
    if(information.isEmpty){
      return double.tryParse(priceController.text)!*n;
    }else{
      double totalMoneyEntry = 0.0;
      for ( var i in information) {
        totalMoneyEntry += i['money'];
      }
      totalMoneyEntry+=(double.tryParse(priceController.text)!*n);
      return totalMoneyEntry;
    }
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
