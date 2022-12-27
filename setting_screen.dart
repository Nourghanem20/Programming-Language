
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/projectlanguage/getx_controller/logic_controller.dart';

class SettingScreen extends StatelessWidget {
  myController controller=Get.put(myController());
  bool isDarkMode=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Setting'),
        actions: [
          GetBuilder<myController>(
          init: myController(),
        builder: (controller)=> IconButton(onPressed:(){
          controller.changTheme(isDarkMode);
            }, icon:Icon(
             controller.isDark?Icons.brightness_4_outlined:
                 Icons.dark_mode
            )),
          )
        ],
      ),
    );
  }
}
