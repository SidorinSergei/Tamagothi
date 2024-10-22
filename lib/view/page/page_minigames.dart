import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/minigame_thumbnail.dart';

class MinigamesPage extends StatefulWidget {
  const MinigamesPage({super.key});

  @override
  State<MinigamesPage> createState() => _MinigamesPageState();
}

class _MinigamesPageState extends State<MinigamesPage> {
  final List<String> items = [
    "Flappy Bird",
    "Fruit Gambling",
    "Snake"
  ];

  final List<String> navigationRoutes = [
    "/flappy_bird",
    "/fruit_gambling",
    "/snake"
  ];

  final List<String> images = [
    "assets/images/minigames/flappy_bird_tn.png",
    "assets/images/minigames/background/background_spin.png",
    "assets/images/minigames/snake.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/minigame_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(items.length, (index) {
            return MinigameThumbnail(
                title: items[index],
                navigationRoute: navigationRoutes[index],
                image: images[index]);}
          ),
        ),
      )
    );
  }
}
