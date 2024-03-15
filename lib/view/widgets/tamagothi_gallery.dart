import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TamagothiGallery extends StatelessWidget {
  final List<String> images =[
    'assets/pers/pers_1.png',
    'assets/pers/pers_2.png'
  ];

  TamagothiGallery({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: screenSize.width*0.5,
      left: screenSize.height*0.05,
      child:SizedBox(
      width: screenSize.width*0.8,
      height: screenSize.height*0.5,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            images[index],
            width: screenSize.width * 0.5,
            height: screenSize.height * 0.8,
          );
        },
      ),
    ),
    );
  }
}