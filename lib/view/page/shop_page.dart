import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/tamagothi_gallery.dart';

class ShopPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/shope_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              TamagothiGallery(),
              MyButtonStyle(path: 'assets/images/button_arrow.png', weigth: 0.65, height: 0.1,leftSize: 0.275, topSize: 0.855,radius: 17, onPressed: (){}),
              MyButtonStyle(path: 'assets/images/button_back.png', weigth: 0.2, height: 0.1,leftSize: 0.025, topSize: 0.855,radius: 15, onPressed: (){Navigator.pop(context);})
            ],
          ),
        ),
      ),
    );
  }
}