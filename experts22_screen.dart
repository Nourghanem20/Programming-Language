import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/projectlanguage/getx_controller/logic_controller.dart';
import 'package:untitled/projectlanguage/items.dart';

class ExpertsScreen22 extends StatefulWidget {
  @override
  State<ExpertsScreen22> createState() => _ExpertsScreen22State();
  Items? cons;


ExpertsScreen22({required this.cons});

}

class _ExpertsScreen22State extends State<ExpertsScreen22> {
  @override
  Widget build(BuildContext context) {
    myController controller1 = Get.put(myController());
    int i=0;
    controller1.changIndex(i);

    return GetBuilder<myController>(
     builder:(controller1)=> Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon:Icon(Icons.arrow_back,
            color: Colors.black,),onPressed: (){},
          ),
          title: Text('${widget.cons!.consulting}',
            style:GoogleFonts.abhayaLibre(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => ItemExperts(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: 10),
        ),
      ),
    );
  }
}

class ItemExperts extends StatelessWidget {
  const ItemExperts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300]),
            child: Column(
              children: [
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CircleAvatar(
                      radius: 30.0,
                    ),
                  ),
                  title: Text(
                    'name of expert',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    'experiences',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 80,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
