import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/scale.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/food_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(left: screenSize.width*0.095, top: screenSize.height*0.25, child: Image.asset('assets/pers/pers_1.png',width: screenSize.width*0.83,height: screenSize.height*0.83,),),
              HealthScale(value:53,size: 0.23,leftSize: 0.39, topSize: 0.822,petImage: Image.asset('assets/images/food.png',width: screenSize.width*0.23,height: screenSize.height*0.23,),),
            ],
          ),
        ),
      ),
    );
  }
}