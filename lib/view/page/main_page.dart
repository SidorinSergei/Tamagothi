import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/scale.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/background_home_page.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(left: screenSize.width*0.095, top: screenSize.height*(-0.07), child: Image.asset('assets/pers/pers_1.png',width: screenSize.width*0.83,height: screenSize.height*0.83,),),
              HealthScale(value:53,size: 0.23,leftSize: 0.06, topSize: 0.52,petImage: Image.asset('assets/images/food.png',width: screenSize.width*0.23,height: screenSize.height*0.23,),),
              HealthScale(value:83,size: 0.23,leftSize: 0.385, topSize: 0.52,petImage: Image.asset('assets/images/washing.png', width: screenSize.width*0.23,height: screenSize.height*0.23,),),
              HealthScale(value:13,size: 0.23,leftSize: 0.7, topSize: 0.52,petImage: Image.asset('assets/images/sleep.png', width: screenSize.width*0.23,height: screenSize.height*0.23,),),
              //MyButtonStyle(path: 'assets/images/button_hz.png',  width: 0.85, height: 0.075,leftSize: 0.07, topSize: 0.74,radius: 50, onPressed: (){}),
              //MyButtonStyle(path: 'assets/images/button_shop.png',  width: 0.85, height: 0.135,leftSize: 0.07, topSize: 0.84,radius: 50, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage()),);})
            ],
          ),
        ),
      ),
    );
  }
}
