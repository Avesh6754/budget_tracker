import 'package:budget_tracker/controller/homeController.dart';
import 'package:budget_tracker/controller/user_Controller.dart';
// import 'package:budget_tracker/views/user_Profile/user_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/homePage.dart';

var usercontroller=Get.put(UserController());

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
            controller.fetchData();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Edit Profile...',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
              letterSpacing: 1),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () async {
                  final name=usercontroller.txtname.text;
                  final email=usercontroller.txtemail.text;
                  final phone=usercontroller.txtphone.text;
                  final age=usercontroller.txtage.text;
                  await usercontroller.insertData(name: name, phone: phone, email: email, age: age);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, letterSpacing: 0.8),
                )),
          )
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              profile_txt_box(label: 'Name', name: usercontroller.txtname),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    profile_txt_box(label: 'Age', name: usercontroller.txtage),
                    SizedBox(
                      height: 20,
                    ),
                    profile_txt_box(label: 'Email', name: usercontroller.txtemail),
                    SizedBox(
                      height: 20,
                    ),
                    profile_txt_box(
                        label: 'Phone No', name: usercontroller.txtphone),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField profile_txt_box(
      {required String label, required TextEditingController name}) {
    return TextField(
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18),
      controller: name,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),

        hintText: '$label',
        hintStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1),
      ),
    );
  }
}
