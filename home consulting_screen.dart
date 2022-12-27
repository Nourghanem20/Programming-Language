import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/categoryscreen.dart';
import 'package:untitled/pages/experts_screen.dart';
import 'package:untitled/projectlanguage/items.dart';
import 'package:untitled/projectlanguage/itemwidget_screen.dart';
import 'package:untitled/projectlanguage/register_screen/search_screen.dart';
import 'package:untitled/projectlanguage/setting_screen.dart';
import 'package:untitled/projectlanguage/user2_screen.dart';
import '../pages/waelabo_screen.dart';

class HomeScreenConsulting extends StatefulWidget {
  @override
  State<HomeScreenConsulting> createState() => _HomeScreenConsultingState();
}

class _HomeScreenConsultingState extends State<HomeScreenConsulting> {
  String? mathStatement;

  //String name_experts = Get.arguments['name experts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(
                  SearchScreen(),
                  // arguments: {
                  //   "name-experts": name_experts.toString(),
                  // },
                );
              },
              icon: Icon(
                Icons.search,
                size: 25.0,
              ),
            ),
          ],
          elevation: 0.0,
        ),
        drawer: Drawer(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: ()
                    {
                      Get.to(UserScreen2());
                    },
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white38,
                      ),
                      accountName: Text(
                        'Nour ghanem',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      accountEmail: Text('nourghanem026@gmail.com'),
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(
                      Icons.home,
                    ),
                    onTap: () {
                      Get.to(HomeScreenConsulting());
                    },
                  ),
                  ListTile(
                    title: Text('Setting'),
                    leading: Icon(
                      Icons.settings,
                    ),
                    onTap: () {
                      //   Get.to(SettingScreen());
                    },
                  ),
                  ListTile(
                    title: Text('About'),
                    leading: Icon(
                      Icons.help_center,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Favourite'),
                    leading: Icon(
                      Icons.favorite,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('My profile'),
                    leading: Icon(
                      Icons.people_outlined,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(
                      Icons.exit_to_app,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white38,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 15,
                    top: 10,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        textDirection: TextDirection.ltr,
                        style:GoogleFonts.abhayaLibre(fontSize: 35,
                            fontWeight: FontWeight.bold,
                        color: Colors.white),),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'What counseling do you want?',
                        textDirection: TextDirection.ltr,
                        style:GoogleFonts.abhayaLibre(fontSize: 20,
                            fontWeight: FontWeight.bold,
                        color: Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 250,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Search here..',
                                    border: InputBorder.none),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.filter_list),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryWidget(),
                      ItemScreen22(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
