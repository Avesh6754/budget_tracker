import 'package:budget_tracker/DbHelper/dbHelper.dart';
import 'package:budget_tracker/modal/budget_modal_class.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Homecontroller extends GetxController{

  RxList<BudgetModalClass> budgetList=<BudgetModalClass>[].obs;
  RxBool isIncome=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    Dbhelper.dbhelper.database;
    fetchData();
    super.onInit();
  }

  Future<void> deleteData(int id)
  async {
   await Dbhelper.dbhelper.deleteRecord(id);
   fetchData();
  }
void checkIncome(bool value)
{
  isIncome.value=value;
}
  Future<void> insertData({required double amount,required int isIncome,required category})
  async {
    await Dbhelper.dbhelper
        .insertRecords(amount, isIncome, DateTime.now().toString(), category);
    fetchData();
  }

  Future<void> fetchData()
  async {
    List data=await Dbhelper.dbhelper.fetchRecords();
    budgetList.value=data.map((e) => BudgetModalClass.fromMap(e),).toList();
  }
}