import 'package:flutter/material.dart';
import 'package:tamagothi/minigames/flappy_bird/flappy_bird_main.dart';
import 'package:tamagothi/minigames/fruit_gambling/fruit_gambling_main.dart';
import 'package:tamagothi/minigames/snake/snake_main.dart';
import 'package:tamagothi/view/page/main_page.dart';
import 'package:tamagothi/view/page/page_food.dart';
import 'package:tamagothi/view/page/page_minigames.dart';
import 'package:tamagothi/view/page/page_reg.dart';
import 'package:tamagothi/view/page/shop_page.dart';
import 'package:tamagothi/view/page/page_authoriz.dart';
import 'package:tamagothi/view/page/page_character_creation.dart';
import 'package:tamagothi/model/model_skin.dart';
import 'package:tamagothi/view/page/cleaning_page.dart';
final foodPageModel = FoodPageModel(foodValue: 50.0);
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Registration(),
        '/login': (context) => Authorization(codeMessage: ''),
        '/creation': (context) => CharacterCreationPage(phoneNumber: '', ),
        '/home': (context) => Scaffold(
        body: PageView(
          children: [
            FoodPage(model: foodPageModel,),
            const HomePage(),
            WashPage(),
            ShopPage(),
            const MinigamesPage(),
          ],
        ),
      ),
        '/page_minigames': (context) => const MinigamesPage(),
        '/flappy_bird': (context) => const FlappyBirdMain(),
        '/fruit_gambling': (context) => FruitGamblingApp(),
        '/snake': (context) => const Snake(),
      },
    );
  }
}
