import 'package:flutter/material.dart';
import 'package:tamagothi/view/page/main_page.dart';
import 'package:tamagothi/view/page/page_food.dart';
import 'package:tamagothi/view/page/page_reg.dart';
import 'package:tamagothi/view/page/shop_page.dart';
import 'package:tamagothi/view/page/page_authoriz.dart';
FoodPageModel model = FoodPageModel(petSkin: 'assets/pers/pers_1.png',foodValue: 20);
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Registration(),
        '/login': (context) => Authorization(),
        '/home': (context) => Scaffold(
          body: PageView(
            children: [
              HomePage(),
              ShopPage(),
              FoodPage(model: model,),
            ],
          ),
        ),
      },
    );
  }
}