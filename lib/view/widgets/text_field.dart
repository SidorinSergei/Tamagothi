import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final double left;
  final double top;
  final double width;
  final double height;
  final String hintText;
  final IconData? icon;
  final TextEditingController controller; // Добавленный контроллер

  const MyTextField({
    Key? key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.hintText,
    this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double iconSize = screenSize.width < 400 ? 20 : 24;
    double textSize = screenSize.width < 400 ? 14 : 16;

    return Positioned(
      left: screenSize.width * left,
      top: screenSize.height * top,
      child: SizedBox(
        width: screenSize.width * width,
        height: screenSize.height * height,
        child: TextField(
          controller: controller, // Использование переданного контроллера
          style: TextStyle(fontSize: textSize),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            prefixIcon: icon != null ? Icon(icon, size: iconSize) : null,
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}


class MyText extends StatelessWidget{
  final double top,left,size;
  final String text;

  const MyText({super.key,
    required this.left,
    required this.top,
    required this.size,
    required this.text,
  });
  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width*left,
        top: screenSize.height*top,
      child: SizedBox(
        width: screenSize.width * 0.5, // Пример задания ширины
        height: screenSize.height * 0.1, // Пример задания высоты
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * size,
            ),
          ),
        ),
      ),
    );
  }
}
