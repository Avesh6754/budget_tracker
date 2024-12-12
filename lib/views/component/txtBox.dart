import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../homePage.dart';


class Text_ButtonBox extends StatelessWidget {
  const Text_ButtonBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green.shade300,
      onPressed: () {
        txtamount.clear();
        txtcategory.clear();
        controller.isIncome.value=false;
        showDialog(

          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.black,
            title: const Text(
              'Add Budget',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: txtamount,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Amount',hintStyle: TextStyle(color: Colors.white)),
                ),
                TextField(
                  controller: txtcategory,
                  style: const TextStyle(color: Colors.white),
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
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    int isIncome = controller.isIncome.value ? 1 : 0;
                    controller.insertData(
                        amount: double.parse(txtamount.text),
                        category: txtcategory.text,
                        isIncome: isIncome);
                    Get.back();
                  },
                  child: const Text('Add',))
            ],
          ),
        );
      },
      child: const Icon(Icons.add,color: Colors.white,),
    );
  }
}
