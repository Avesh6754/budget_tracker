import 'package:budget_tracker/DbHelper/dbHelper.dart';
import 'package:budget_tracker/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/txtBox.dart';

var controller = Get.put(Homecontroller());
TextEditingController txtamount = TextEditingController();
TextEditingController txtcategory = TextEditingController();

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hi Avesh...'),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.budgetList.length,
            itemBuilder: (context, index) => Card(
              color: controller.budgetList[index].isIncome == 1
                  ? Colors.green.shade200
                  : Colors.red.shade200,
              child: ListTile(
                leading: Text(controller.budgetList[index].id.toString()),
                title: Text(controller.budgetList[index].amount.toString()),
                subtitle: Text(controller.budgetList[index].category!),
                trailing: IconButton(onPressed: () {
                  controller.deleteData(controller.budgetList[index].id!);
                },icon:Icon(Icons.delete,color: Colors.red,),),

              ),
            ),
          ),
        ),
        floatingActionButton: Text_ButtonBox()
    );
  }
}
