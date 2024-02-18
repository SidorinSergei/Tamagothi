import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyButtonStyle extends StatelessWidget{
  final String path;
  final double topSize,width,height,radius,leftSize;
  final VoidCallback onPressed;
  final String? text;

  const MyButtonStyle({
    Key? key,
    required this.path,
    required this.width,
    required this.height,
    required this.leftSize,
    required this.topSize,
    required this.radius,
    required this.onPressed,
    this.text
}): super(key: key);

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      left: screenSize.width*leftSize,
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
            width: screenSize.width * width, // 0.85
            height: screenSize.height * height,
            alignment: Alignment.center,
            child:text != null ? FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text!,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ) : null,
          ),
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double left;
  final double top;
  final double? right;
  final double? bottom;

  const MyTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.left,
    required this.top,
    this.right,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double textSize = screenSize.width *0.06;

    return Positioned(
      left: screenSize.width*left,
      top: screenSize.height*top,//0.55
      right: right,
      bottom: bottom,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: Colors.lightBlueAccent,
          textStyle: TextStyle(fontSize: textSize),
          padding: EdgeInsets.all(16),
        ),
        child: Text(text),
      ),
    );
  }
}