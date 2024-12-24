import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/component/updateTxtBpx.dart';
import '../home/homePage.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () async {
            Get.back();
            await controller.fetchData();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Transaction',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25,letterSpacing: 1),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: TextField(
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              controller: controller.txtsearch,
              onChanged: (value) {
                controller.fetchBySearch(value);
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ),
                ),
                hintText: 'Search by category',
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
