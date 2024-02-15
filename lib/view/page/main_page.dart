import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/button_style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_home_page.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              MyButtonStyle(path: 'assets/images/button_food.png', screenSize: screenSize, weigth: 0.85, height: 0.1, topSize: 0.555, radius: 50, onPressed: (){}),
              MyButtonStyle(path: 'assets/images/button_hz.png', screenSize: screenSize, weigth: 0.85, height: 0.075, topSize: 0.74,radius: 50, onPressed: (){}),
              MyButtonStyle(path: 'assets/images/button_shop.png', screenSize: screenSize, weigth: 0.85, height: 0.135, topSize: 0.84,radius: 50, onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
