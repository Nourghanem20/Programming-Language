import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/experts22_screen.dart';
import 'package:untitled/pages/experts_screen.dart';
import 'package:untitled/projectlanguage/getx_controller/logic_controller.dart';
import 'package:untitled/projectlanguage/items.dart';
import 'package:untitled/projectlanguage/itemwidget_screen.dart';

class ItemScreen22 extends StatelessWidget {
  List<String> list = [
    'Medical',
    'Professional',
    'Familial',
    'Psychological',
    'Business'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                Text('All',
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.abhayaLibre(fontSize: 25,
                        fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            children: List.generate(
              list.length,
              (index) => Container(
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(ExpertsScreen22(
                          cons: name[index],
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image.asset(
                            'assets/images/$index.png',
                            height: 160,
                            width: 160,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8, left: 16),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${list[index]}',
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
