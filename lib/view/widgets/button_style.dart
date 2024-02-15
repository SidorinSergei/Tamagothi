import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyButtonStyle extends StatelessWidget{
  final String path;
  final Size screenSize;
  final double topSize,weigth,height,radius;
  final VoidCallback onPressed;

  const MyButtonStyle({
    Key? key,
    required this.path,
    required this.screenSize,
    required this.weigth,
    required this.height,
    required this.topSize,
    required this.radius,
    required this.onPressed
}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Positioned(
      left: screenSize.width*0.07,
      top: screenSize.height*topSize,//0.55
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            width: screenSize.width * weigth, // 0.85
            height: screenSize.height * height,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}