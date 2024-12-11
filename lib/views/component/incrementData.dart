import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../homePage.dart';


class Increment_Box extends StatelessWidget {
  const Increment_Box({
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
              color: Colors.green),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green.shade200,
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(() =>  Text(
                  '+${controller.income}',
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