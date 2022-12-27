import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/dio/constants_url.dart';
import 'package:untitled/projectlanguage/dio/dio.dart';
import 'package:untitled/projectlanguage/getx_controller/logic_controller.dart';
import 'package:untitled/projectlanguage/home%20consulting_screen.dart';
import 'package:untitled/projectlanguage/models/register_models.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class NextRegisterScreen extends StatefulWidget {
  @override
  State<NextRegisterScreen> createState() => _NextRegisterScreenState();
}

class _NextRegisterScreenState extends State<NextRegisterScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController textDetailsController = TextEditingController();
  TextEditingController textDetailsController2 = TextEditingController();
  RegisterModel? model;

  String textFamilyConsulting = "Family Family Family";

  String name = Get.arguments['name'];
  String email = Get.arguments['email'];
  String phone = Get.arguments['phone'];
  String password = Get.arguments['password'];

  List<String> list = [
    "Medical ",
    "Family ",
    "Business ",
    "Professional",
    "Psychological ",
  ];

  myController controller = Get.put(myController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<myController>(
          init: myController(),
          builder: (controller) => Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 50.0),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 130.0,
                    backgroundImage: AssetImage('assets/images/people.jpg'),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 2.0, top: 2.0, right: 25.0),
                    child: IconButton(
                      onPressed: () async {
                        // await controller.getImage();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 35.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black)),
                  child: TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(
                        Icons.post_add,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'you must enter your address ';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    underline: SizedBox(width: 0.0),
                    isExpanded: true,
                    hint: Text(
                      "Please Choose Your Consulting",
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.pacifico(color: Colors.black),
                    ),
                    items: list
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e,
                          ),
                        )
                        .toList(),
                    iconEnabledColor: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    onChanged: (String? value) {
                      controller.changeCons(value);
                    },
                    value: controller.value4,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Details about consulting",
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.pacifico(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0,
                ),
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 10.0,
                ),
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TextFormField(
                  controller: textDetailsController,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Details this consulting",
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.pacifico(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 5.0,
                ),
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 10.0,
                ),
                height: 150.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TextFormField(
                  controller: textDetailsController2,
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              GetBuilder<myController>(
                builder: (context) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.deepPurple,
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  width: double.infinity,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: () {
                      DioHelper2.postData(
                        url: registerUrl,
                        data: {
                          'email': email.toString(),
                          'password': password.toString(),
                          'phone': phone.toString(),
                          'address': addressController.text,
                          'name': name.toString(),
                          'details_consulting': textDetailsController.text,
                          'name_consulting': controller.value4,
                          'excperiense_details': textDetailsController2.text,
                        },
                      ).then((value) {
                        print("hello 1");
                        print(value.data);

                        model = RegisterModel.fromJson(value.data);
                        print(model!.token);
                        if (model!.token == null)
                        {
                          Fluttertoast.showToast(
                              msg: "please check your information ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        if (model!.token != null)
                        {
                          Fluttertoast.showToast(
                              msg: "Success ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Get.toNamed("/pages5");
                        }
                        print("hello 2");
                      }).catchError((error) {
                        print("hello 3");
                        print(error.toString());
                      });
                    },
                    child: Text(
                      'Register Experts',
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.acme(fontSize: 30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
