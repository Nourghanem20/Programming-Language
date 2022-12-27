import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            children: [
              Text(
                'Popular',
                textDirection: TextDirection.ltr,
                style: GoogleFonts.abhayaLibre(fontSize: 25,
                    fontWeight: FontWeight.bold),

                )
              ,
            ],
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i <= 4; i +=2)
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.grey[300], boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                      )
                    ]),
                    child: Image.asset(
                      'assets/images/$i.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
              ],
            ))
      ],
    );
  }
}
