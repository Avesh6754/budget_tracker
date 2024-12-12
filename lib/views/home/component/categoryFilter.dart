import 'package:flutter/material.dart';

import '../homePage.dart';


class Category_Filter extends StatelessWidget {
  const Category_Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              controller.fetchData();
            },
            child: const Text(
              'All',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16),
            )),
        ElevatedButton(
            onPressed: () {
              controller.fetchbyfiletr(1);
            },
            child: const Text(
              'Income',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16),
            )),
        ElevatedButton(
            onPressed: () {
              controller.fetchbyfiletr(0);
            },
            child: const Text(
              'Expense',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16),
            ))
      ],
    );
  }
}