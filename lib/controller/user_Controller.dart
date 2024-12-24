import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../DbHelper/user_db_helper.dart';

class UserController extends GetxController{
  var txtname=TextEditingController();
  var txtemail=TextEditingController();
  var txtphone=TextEditingController();
  var txtage=TextEditingController();
  @override
  void onInit()
  {
    UserHelper.userHelper.database;
    super.onInit();
  }
  Future<void> insertData({required String name,required String phone,required String email,required String age})
  async {
    await UserHelper.userHelper.insertRecord(name:name,age: age,email: email,phone: phone);
  }
}