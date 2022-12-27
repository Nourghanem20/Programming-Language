import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/dio/constants_url.dart';
import 'package:untitled/projectlanguage/dio/dio.dart';
import 'package:untitled/projectlanguage/getx_controller/logic_controller.dart';
import 'package:untitled/projectlanguage/home%20consulting_screen.dart';
import 'package:untitled/projectlanguage/models/login_model.dart';
import 'package:untitled/projectlanguage/register_screen/registerlang_screen.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class LoginLang extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginModel? loginModel;
  myController controller = Get.put(myController());
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: GetBuilder<myController>(
                  init: myController(),
                  builder: (controller) => Column(
                    children: [
                      Image.asset(
                        'assets/images/applog.png',
                        fit: BoxFit.fill,
                        height: 200,
                      ),
                      Center(
                        child: Text("Welcome",
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.abhayaLibre(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      Text('Sign into your account',
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email,
                                color: Colors.deepPurple,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'you must enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: controller.isPassword,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.deepPurple,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(controller.isPassword
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye,
                                  color: Colors.deepPurple,),
                                onPressed: () {
                                  controller.changePassword();
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'you must enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.deepPurpleAccent),
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                DioHelper2.postData(url: loginUrl, data: {
                                  "email": emailController.text,
                                  "password": passwordController.text,
                                }).then((value) {
                                  print("hello 1");
                                  print(value.data);
                                  loginModel = LoginModel.fromJson(value.data);
                                  print(loginModel!.token);
                                  if (loginModel!.token == null) {
                                    print("token is null ");
                                    Fluttertoast.showToast(
                                        msg: "Please check your information",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Success",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Get.off(
                                      HomeScreenConsulting(),
                                    );
                                  }
                                  print("hello 2");
                                }).catchError((error) {
                                  print("error");
                                  print(error.toString());
                                });
                              }
                            },
                            child: Text(' Sign in ',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',
                              textDirection: TextDirection.ltr,
                              style: GoogleFonts.abhayaLibre(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(
                            width: 10.0,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/pages2');
                            },
                            child: Text('Create',
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.abhayaLibre(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
