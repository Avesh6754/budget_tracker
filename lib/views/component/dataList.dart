import 'package:budget_tracker/views/component/updateTxtBpx.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';

class Datalist extends StatelessWidget {
  const Datalist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.budgetList.length,
      itemBuilder: (context, index) => Card(
        color: controller.budgetList[index].isIncome == 1
            ? Colors.green.shade200
            : Colors.red.shade200,
        child: ListTile(
          leading: Text(
              controller.budgetList[index].id.toString()),
          title: Text(controller.budgetList[index].amount
              .toString()),
          subtitle: Text(controller
              .budgetList[index].category! +
              " " "${controller.budgetList[index].date}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text_Update(
                  currentBudget:
                  controller.budgetList[index]),
              IconButton(
                onPressed: () {
                  controller.deleteData(
                      controller.budgetList[index].id!);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
