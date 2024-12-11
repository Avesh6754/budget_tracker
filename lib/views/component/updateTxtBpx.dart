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
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Add Amount',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: txtamount,
                  decoration: InputDecoration(hintText: 'Amount'),
                ),
                TextField(
                  controller: txtcategory,
                  decoration: InputDecoration(hintText: 'Category'),
                ),
                Obx(
                      () => SwitchListTile(
                    title: Text('Income'),
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
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    int isIncome = controller.isIncome.value ? 1 : 0;
                    controller.insertData(
                        amount: double.parse(txtamount.text),
                        category: txtcategory.text,
                        isIncome: isIncome);
                    Get.back();
                  },
                  child: Text('Add'))
            ],
          ),
        );
      },
      child: Icon(Icons.add),
    );
  }
}