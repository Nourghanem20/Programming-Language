import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/model/item.dart';
import 'package:get/get.dart';
import 'package:untitled/projectlanguage/edituser_screen.dart';

class Item {
  String? type;
  String? text;
  IconData? icon;

  Item({required this.type, required this.text, required icon});
}

class UserScreen2 extends StatefulWidget {
  @override
  State<UserScreen2> createState() => _UserScreen2State();
}

class _UserScreen2State extends State<UserScreen2> {
  List<Item> list = [
  Item(type: 'Name', text: "Nour ghanem", icon: Icon(Icons.person)),

    Item(
        type: 'Email Address',
        text: 'nourgh2402@gmail.com',
        icon: Icon(Icons.email_sharp,
        color: Colors.deepPurple,)),
    Item(type: 'Password', text: "123456789", icon: Icon(Icons.lock)),
    Item(type: 'Phone', text: "123456789", icon: Icon(Icons.phone)),
    Item(
        type: 'Joined Date',
        text: '4 December 2022',
        icon: Icon(Icons.access_time)),];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0.0,),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            StackContainer(),
            SizedBox(
              height: 10.0,
            ),
            ListView.separated(
              itemBuilder: ((context, index) => CardItem(list[index])),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: list.length,
            ),
          ],
        ),
      ),
    );
  }
}

Widget CardItem(Item list) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  list.icon,
                  size: 40,
                  color: Colors.black,

                ),
              ),
              SizedBox(
                width: 20.0,
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${list.type}',
                style: GoogleFonts.abhayaLibre(fontSize: 30,
                    fontWeight: FontWeight.bold),
                    ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${list.text}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Stack(children: <Widget>[
        Container(),
        ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.deepPurple, Colors.grey]),
            borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(40),
              bottomLeft: Radius.circular(40),

            )),
          ),
        ),
        TopBar(),
        Align(
          alignment: Alignment(0, 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 180),
                child: Text('My Profile',
                  style: GoogleFonts.abhayaLibre(fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),),

            ],
          ),
        ),
      ]),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Get.to(EditUser());
              },
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height*2);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
