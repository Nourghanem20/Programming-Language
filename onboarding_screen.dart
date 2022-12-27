
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/loginlang_screen.dart';
import 'package:untitled/projectlanguage/register_screen/registerlang_screen.dart';

class OnBoarding extends StatefulWidget {


  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
      ,
      body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/interfaceapp.png',
                height: 300,
                width: 300,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(' Consulting app ',
                  textDirection: TextDirection.ltr,
                    style:GoogleFonts.abhayaLibre(fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)
               ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(100),
                        color: Colors.deepPurpleAccent),
                    child: MaterialButton(
                      onPressed: () {
                        Get.toNamed('/pages1');

                      },
                      child:  Text('Get started ',
                        textDirection: TextDirection.ltr,
                          style:GoogleFonts.abhayaLibre(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)
                      ),
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),
    );

  }
}
