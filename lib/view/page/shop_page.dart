import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/tamagothi_gallery.dart';
import 'package:tamagothi/view/widgets/text_field.dart';

class ShopPage extends StatelessWidget{
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/shope_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              const MyText(left: -0.035, top: 0.01, size: 0.05, text: '100₴'),
              const MyText(left: 0.57, top: 0.01, size: 0.05, text: '97'),
              TamagothiGallery(),
              const MyText(left: 0.26, top: 0.76, size: 0.1,text: '50₴'),
              MyButtonStyle(path: 'assets/images/button_arrow.png', width: 0.7, height: 0.1,leftSize: 0.16, topSize: 0.85,radius: 17, onPressed: (){},text: 'Выбрать',),
              //MyButtonStyle(path: 'assets/images/button_back.png', width: 0.2, height: 0.1,leftSize: 0.025, topSize: 0.855,radius: 15, onPressed: (){Navigator.pop(context);})
            ],
          ),
        ),
      ),
    );
  }
}