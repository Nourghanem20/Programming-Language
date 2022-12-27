import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/model/item.dart';

// class Info {
//   String? name;
//   String? email;
//   int? phone;
//   String? address;
//   String? password;
//   String? nameConsulting;
//   String? detailsConsulting;
//   String? experience;
//
//   Info({required this.name, required this.phone, required this.email,
//     required this.address, required this.password, required this.detailsConsulting,
//     required this.experience, required this.nameConsulting});
//
//
// }
class Info{
  IconData? icon;
  String? name;
  String? details;
  Info({required this.icon,required this.name,required this.details});
}
class ExpertProfile extends StatelessWidget {
  List<Info>list=[
    Info(icon:Icons.person, name:'Name', details:'Nour'),
    Info(icon:Icons.email, name:'Email', details:'Nourghanem@gmail.com'),
    Info(icon:Icons.phone, name:'phone', details:'0991283552'),

    Info(icon:Icons.lock, name:'password', details:'123456'),

    Info(icon:Icons.post_add, name:'address', details:'Damascus'),

    Info(icon:Icons.contact_support, name:'nameConsulting', details:'Medical'),

    Info(icon:Icons.details, name:'Details Consulting', details:'no app'),

    Info(icon:Icons.explore, name:'experience', details:'doctor'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
            fit: StackFit.expand,
            children: [
        Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.grey],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter)),
    ),
    Scaffold(
    backgroundColor: Colors.transparent,
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {},
    ),
    IconButton(
    icon: Icon(Icons.logout),
    onPressed: () {},
    ),
    ],
    ),
    Text(
    'My Profile',
    style: TextStyle(
    fontSize: 30,
    ),
    ),
    SizedBox(
    height: 40,
    ),
    CircleAvatar(
    backgroundImage: AssetImage('assets/images/people.jpg'),
    radius: 80,
    ),
    SizedBox(
    height: 15,
    ),
    Text(
    'Name of Expert',
    style: TextStyle(fontSize: 20),
    ),
    SizedBox(
    height: 40,
    ),
    ListView.separated(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemBuilder:((context, index) =>CardItem(list[index])),
    separatorBuilder:((context,index)=>SizedBox(height: 20,))
    ,itemCount:8)

    ]),
    ),
    ),
    )
    ],
    ),
    );
    }
}
Widget CardItem(Info list) => Padding(
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
                '${list.name}',
                style: GoogleFonts.abhayaLibre(fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${list.details}',
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    ),
  ),
);

