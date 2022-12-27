
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/user2_screen.dart';

import 'getx_controller/logic_controller.dart';

class EditUser extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    myController controller = Get.put(myController());
    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,

        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {
          Get.off(UserScreen2());
        },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),

        ),
        actions: [
          IconButton(onPressed: (){}, icon:IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.deepPurple,
            ),onPressed: (){},
          ))
        ],
      ),
      body: GetBuilder<myController>(
        init: myController(),
       builder:(controller)=> ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16,
              left: 19,
              top: 25),
              child: Text('Edit Profile',
              style: GoogleFonts.abhayaLibre(fontSize: 35,
                  fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
                  padding: const EdgeInsets.all(15.0),

                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.black
                      ),
                      prefixIcon: Icon(Icons.person,
                      color: Colors.deepPurple,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                       )
                      )


            ),
              ),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    prefixIcon: Icon(Icons.email,
                    color: Colors.deepPurple,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                    )


                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.black
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
                    prefixIcon: Icon(Icons.lock,
                    color: Colors.deepPurple,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                    )


                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),

              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),

                    prefixIcon: Icon(Icons.phone,
                      color: Colors.deepPurple,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                    )


                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
               color: Colors.deepPurple
                  ),
                  child: MaterialButton(onPressed: (){},
                  child: Text('update',
                    style: GoogleFonts.abhayaLibre(fontSize: 30,
                        fontWeight: FontWeight.bold),

                    ),),
                ),
                SizedBox(
                  width:20 ,
                ),
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey[300],

                  ),
                  child: MaterialButton(onPressed: (){},
                    child: Text('cancel',
                        style: GoogleFonts.abhayaLibre(fontSize: 30,
                            fontWeight: FontWeight.bold),),
                ))
              ],
            )
          ],
        ),
      ),
    );}}