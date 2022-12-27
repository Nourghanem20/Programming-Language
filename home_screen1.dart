import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/shared/main.dart';

class HomeAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
        actions: [

          IconButton(

          onPressed: () {
            if(Get.isDarkMode)
            {
              Get.changeTheme(ThemeData.light());

            }
            else
            {
              Get.changeTheme(ThemeData.dark());
            }
          },
              icon:Icon(Get.isDarkMode?Icons.dark_mode:Icons.light_mode)),


        ],
      ),
    );
  }
}
