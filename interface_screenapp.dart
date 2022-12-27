import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class InterfaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CarouselSlider(
              items: [
                Container(
                  height: double.infinity,
                    child: Image.asset('assets/images/nou.jpeg.webp')),
              ],
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
              ))
        ],
      ),
    );
  }
}
