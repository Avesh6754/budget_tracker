import 'dart:ffi';

import 'package:budget_tracker/DbHelper/dbHelper.dart';
import 'package:budget_tracker/DbHelper/user_db_helper.dart';
import 'package:budget_tracker/modal/budget_modal_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Homecontroller extends GetxController {
  RxList<BudgetModalClass> budgetList = <BudgetModalClass>[].obs;
  var txtsearch=TextEditingController();

  RxBool isIncome = false.obs;
  RxDouble income = 0.0.obs;
  RxDouble balance = 0.0.obs;
  RxDouble expense = 0.0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    Dbhelper.dbhelper.database;

    fetchData();

    super.onInit();
  }

  Future<void> deleteData(int id) async {
    await Dbhelper.dbhelper.deleteRecord(id);
    await fetchData();

  }

  void checkIncome(bool value) {
    isIncome.value = value;
  }

  Future<void> insertData(
      {required double amount,
      required int isIncome,
      required category}) async {
    DateTime dateTime = DateTime.now();
    await Dbhelper.dbhelper.insertRecords(amount, isIncome,
        '${dateTime.day}/${dateTime.month}/${dateTime.year}', category);
    await fetchData();
  }

  Future<void> fetchData() async {
    List data = await Dbhelper.dbhelper.fetchRecords();
    budgetList.value = data
        .map(
          (e) => BudgetModalClass.fromMap(e),
        )
        .toList();
    await calculate();
  }

  Future<void> updateData(
      {required double amount,
      required int isIncome,
      required category,
      required int id}) async {
    DateTime dateTime = DateTime.now();
    await Dbhelper.dbhelper.updateRecords(amount, isIncome,
        '${dateTime.day}/${dateTime.month}/${dateTime.year}', category, id);
    await fetchData();
  }

  Future<void> fetchbyfiletr(int isIncome) async {

    List data = await Dbhelper.dbhelper.fetchDatafromFilter(isIncome);
    budgetList.value = data
        .map(
          (e) => BudgetModalClass.fromMap(e),
        )
        .toList();

  }
  Future<void> fetchBySearch(String search)
  async {
    List data = await Dbhelper.dbhelper.filterBySeacrh(search);
    budgetList.value = data
        .map(
          (e) => BudgetModalClass.fromMap(e),
    )
        .toList();
  }


  Future<void> calculate() async {
    List data = await Dbhelper.dbhelper.fetchRecords();
    budgetList.value = data
        .map(
          (e) => BudgetModalClass.fromMap(e),
        )
        .toList();
    income.value = 0;
    expense.value = 0;
    balance.value = 0;
    for (var i in budgetList) {
      if (i.isIncome == 1) {
        income.value += i.amount!;
      } else {
        expense.value += i.amount!;
      }
    }
    balance.value = income.value - expense.value;
  }
}
