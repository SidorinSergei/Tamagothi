import 'package:flutter/material.dart';
import 'package:tamagothi/minigames/flappy_bird/flappy_bird_main.dart';
import 'package:tamagothi/view/page/main_page.dart';
import 'package:tamagothi/view/page/page_food.dart';
import 'package:tamagothi/view/page/page_minigames.dart';
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
        '/': (context) => const Registration(),
        '/login': (context) => const Authorization(),
        '/home': (context) => Scaffold(
        body: PageView(
          children: [
            const HomePage(),
            ShopPage(),
            const MinigamesPage(),
            FoodPage(model: model,)
          ],
        ),
      ),
        '/flappy_bird': (context) => const FlappyBirdMain(),
      },
    );
  }
}
