import 'package:budget_tracker/modal/budget_modal_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../homePage.dart';
class Text_Update extends StatelessWidget {
  const Text_Update({
    super.key,
    required this.currentBudget,
  });
final BudgetModalClass currentBudget;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        txtamount.text=currentBudget.amount.toString();
        txtcategory.text=currentBudget.category!;
        controller.isIncome.value=currentBudget.isIncome==1?true:false;

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.black,
            title: const Text(
              'Update Budget',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(

                  controller: txtamount,

                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(hintText: 'Amount',hintStyle: TextStyle(color: Colors.white,),),
                ),
                TextField(
                  controller: txtcategory,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(hintText: 'Category',hintStyle: TextStyle(color: Colors.white)),
                ),
                Obx(
                      () => SwitchListTile(
                    title: const Text('Income',style: TextStyle(color: Colors.white),),
                    value: controller.isIncome.value,
                    onChanged: (value) {
                      controller.checkIncome(value);
                    },
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel',style: TextStyle(),)),
              TextButton(
                  onPressed: () {
                    int isIncome = controller.isIncome.value ? 1 : 0;
                    controller.updateData(
                        amount: double.parse(txtamount.text),
                        category: txtcategory.text,
                        isIncome: isIncome,
                    id: currentBudget.id!);
                    Get.back();
                  },
                  child: const Text('Update'))
            ],
          ),
        );
      },
      icon: const Icon(Icons.edit),
    );
  }
}