import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/view/page/shop_page.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/tamagothi_gallery.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/background_home_page.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(left: screenSize.width*0.095, top: screenSize.height*(-0.07), child: Image.asset('assets/pers/pers_1.png',width: screenSize.width*0.83,height: screenSize.height*0.83,),),
              MyButtonStyle(path: 'assets/images/button_food.png', width: 0.85, height: 0.1,leftSize: 0.07, topSize: 0.555, radius: 50, onPressed: (){}),
              MyButtonStyle(path: 'assets/images/button_hz.png',  width: 0.85, height: 0.075,leftSize: 0.07, topSize: 0.74,radius: 50, onPressed: (){}),
              MyButtonStyle(path: 'assets/images/button_shop.png',  width: 0.85, height: 0.135,leftSize: 0.07, topSize: 0.84,radius: 50, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage()),);})
            ],
          ),
        ),
      ),
    );
  }
}
