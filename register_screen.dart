import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/dio/constants_url.dart';
import 'package:untitled/projectlanguage/dio/dio.dart';
import 'package:untitled/projectlanguage/getx_controller/logic_controller.dart';
import 'package:untitled/projectlanguage/home%20consulting_screen.dart';
import 'package:untitled/projectlanguage/models/login_model.dart';
import 'package:untitled/projectlanguage/next_register_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    double widthButton = double.infinity;
    String? vlaue1;
    myController controller = Get.put(myController());
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    LoginModel? loginModel ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: GetBuilder<myController>(
                  init: myController(),
                  builder: (controller) => Column(
                    children: [
                      Image.asset('assets/images/applog.png', height: 250),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sign up",
                            textDirection: TextDirection.ltr,
                             style: GoogleFonts.abhayaLibre(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )
                          )],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Icon(Icons.people_alt_sharp,
                            color: Colors.deepPurple,),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Icon(Icons.email,
                            color: Colors.deepPurple,),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.isPassword,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: ' password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Icon(Icons.lock,
                            color: Colors.deepPurple,),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPassword
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                             color: Colors.deepPurple,),
                            onPressed: () {
                              controller.changePassword();
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Icon(Icons.phone,
                            color: Colors.deepPurple,),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'you must enter your phone number';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(30.0),
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.deepPurple,
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          underline: SizedBox(width: 0.0),
                          isExpanded: true,
                          hint: Text(
                            "Please Choose Your Role",
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.abhayaLibre(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          value: controller.value3,
                          items: ["Experts", "User"]
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
                            controller.changeRole(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      if (controller.value3 == "Experts")
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
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
                              Get.toNamed('/pages3', arguments: {
                                "email": emailController.text,
                                "name": nameController.text,
                                "phone": phoneController.text,
                                "password": passwordController.text,
                              });
                            },
                            child: Text(
                              'Next  >>>',
                              textDirection: TextDirection.ltr,
                              style: GoogleFonts.abrilFatface(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      if (controller.value3 == "User")
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(width: 2.0, color: Colors.white),
                          ),
                          width: widthButton,
                          height: 50.0,
                          child: MaterialButton(
                            enableFeedback: true,
                            highlightElevation: 20.0,
                            animationDuration: Duration(milliseconds: 2),
                            elevation: 20.0,
                            colorBrightness: Brightness.light,
                            minWidth: widthButton,
                            splashColor: Colors.white,
                            onPressed: () {
                             // Get.toNamed('/pages4');
                              DioHelper2.postData(url: registerUser, data: {
                                'name' : nameController.text ,
                                "email" : emailController.text ,
                                "phone": phoneController.text ,
                                "password" : passwordController.text,
                              }).then(
                                    (value) {
                                      print("hello 1");
                                      print(value.data);
                                      loginModel = LoginModel.fromJson(value.data);
                                      print(loginModel!.token);
                                      if (loginModel!.token == null) {
                                        print("token is null ");
                                        Fluttertoast.showToast(
                                            msg: "Success",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                        Get.offAll(HomeScreenConsulting());
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Error",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                      //  Get.off(HomeScreenConsulting());
                                      }
                                      print("hello 2");
                                    },
                                  )
                                  .catchError(
                                    (error) {},
                                  );
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
