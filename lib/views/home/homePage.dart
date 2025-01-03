import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:budget_tracker/DbHelper/dbHelper.dart';
import 'package:budget_tracker/controller/homeController.dart';
import 'package:budget_tracker/modal/budget_modal_class.dart';
import 'package:budget_tracker/utils/global.dart';
import 'package:budget_tracker/views/search_Page/searchPage.dart';
import 'package:budget_tracker/views/user_Profile/component/edit_profile.dart';
// import 'package:budget_tracker/views/user_Profile/user_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'component/categoryFilter.dart';
import 'component/decrementData.dart';
import 'component/incrementData.dart';
import 'component/txtBox.dart';
import 'component/updateTxtBpx.dart';

var controller = Get.put(Homecontroller());
TextEditingController txtamount = TextEditingController();
TextEditingController txtcategory = TextEditingController();

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
              ),
            ),
          ),
          title: const Text(
            'Welcome Avesh...',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Searchpage(),
                        ));
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.balance > 0
                              ? Colors.green.shade200
                              : Colors.red.shade200,
                          width: 1.5),
                      borderRadius: BorderRadius.circular(25),
                      gradient: controller.balance > 0
                          ? LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                  Colors.green.shade400,
                                  Colors.green.shade300,
                                  Colors.green.shade200,
                                  Colors.green.shade100,
                                  Colors.green.shade50,
                                  Colors.white
                                ])
                          : LinearGradient(
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
                          style: const TextStyle(
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
            const Padding(
              padding: EdgeInsets.all(8.0),
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
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Column(
              children: [
                Container(
                  child: Category_Filter(),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
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
                      leading: CircleAvatar(
                          child: Text(
                        controller.budgetList[index].id.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      )),
                      title: Text(
                        controller.budgetList[index].amount.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      subtitle: Text(
                        controller.budgetList[index].category! +
                            "  " "${controller.budgetList[index].date}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          update_Text(context, controller.budgetList[index]),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                controller.deleteData(
                                    controller.budgetList[index].id!);
                              },
                              icon: Icon(Icons.delete))
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
