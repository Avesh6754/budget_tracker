import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:budget_tracker/DbHelper/dbHelper.dart';
import 'package:budget_tracker/controller/homeController.dart';
import 'package:budget_tracker/modal/budget_modal_class.dart';
import 'package:budget_tracker/utils/global.dart';
import 'package:budget_tracker/views/component/updateTxtBpx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/decrementData.dart';
import 'component/incrementData.dart';
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
          title: Text('Hi Avesh...',style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                      gradient: controller.balance>0?LinearGradient(
                        begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Colors.green.shade400,
                        Colors.green.shade300,
                        Colors.green.shade200,
                        Colors.green.shade100,
                        Colors.green.shade50,
                        Colors.white
                      ]):LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Colors.red.shade400,
                        Colors.red.shade300,
                        Colors.red.shade200,
                        Colors.red.shade100,
                        Colors.red.shade50,
                        Colors.white
                      ])),
                  child: BlurryContainer(
                    blur: 15,
                    height: 240,
                    elevation: 6,
                    padding: const EdgeInsets.all(25),
                    color: Colors.white.withOpacity(0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            'https://img.indiaforums.com/person/480x360/0/0211-hrithik-roshan.jpg?c=4lP5F3',
                          ),
                        ),
                        const Spacer(),
                         Text(
                          "\$${controller.balance}",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Avesh Prajapati".toUpperCase(),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "DATE",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                letterSpacing: 1,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${dateTime.month}/${dateTime.year}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Increment_Box(),
                  SizedBox(
                    width: 10,
                  ),
                  Decrement_Box(),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoButton(
                          onPressed: () {
                            controller.fetchData();
                          },
                          child: Text(
                            'All',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )),
                      CupertinoButton(
                          onPressed: () {
                            controller.fetchbyfiletr(1);
                          },
                          child: Text(
                            'Income',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )),
                      CupertinoButton(
                          onPressed: () {
                            controller.fetchbyfiletr(0);
                          },
                          child: Text(
                            'Expense',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.budgetList.length,
                  itemBuilder: (context, index) => Card(
                    color: controller.budgetList[index].isIncome == 1
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                    child: ListTile(
                      leading: Text(controller.budgetList[index].id.toString()),
                      title:
                          Text(controller.budgetList[index].amount.toString()),
                      subtitle: Text(controller.budgetList[index].category! +
                          " " "${controller.budgetList[index].date}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text_Update(
                              currentBudget: controller.budgetList[index]),
                          IconButton(
                            onPressed: () {
                              controller
                                  .deleteData(controller.budgetList[index].id!);
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
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Text_ButtonBox());
  }
}
