import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Container(

    child: Column(
      children: [
        Container(
              child: CustomPaint(
                painter: CurvePainter(),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                             CircleAvatar(
                               radius: 60,
                               backgroundImage:AssetImage('assets/images/flower.jpg') ,
                             ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('User name',
                              style: TextStyle(
                                fontSize: 25
                              ),)
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
        SizedBox(
          height: 50,
        ),
        ListTile(

         title: Text('Your Profile',
          style: TextStyle(
            fontSize: 30
          ),),
        ),
        SizedBox(
          height: 40,
        ),
        ListTile(
          leading: Icon(Icons.email_sharp),
          title: Text('Email',
          style: TextStyle(
            fontSize:25
          ),),
        ),
        SizedBox(
          height: 40,
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Password',
            style: TextStyle(
                fontSize:25
            ),),
        ),

      ],
    ),
  ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color =Colors.deepPurpleAccent;
    // create a path

    Path path = Path();
    path.lineTo(0, size.height * 0.100);
    path.quadraticBezierTo(size.height, size.height * 0.60, size.width, size.width * 0.75);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
