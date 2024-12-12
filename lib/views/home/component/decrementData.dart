import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../homePage.dart';

class Decrement_Box extends StatelessWidget {
  const Decrement_Box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red.shade200,
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(() =>  Text(
                  '-${controller.expense}',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20),
                ),)

              ],
            ),
          ),
        ));
  }
}
