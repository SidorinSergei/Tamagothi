import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/minigame_thumbnail.dart';

class MinigamesPage extends StatefulWidget {
  const MinigamesPage({super.key});

  @override
  State<MinigamesPage> createState() => _MinigamesPageState();
}

class _MinigamesPageState extends State<MinigamesPage> {
  final List<String> items = ["Flappy Bird"];
  final List<String> navigationRoutes = ["/flappy_bird"];
  final List<String> images = ["assets/images/minigames/flappy_bird_tn.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(items.length, (index) {
          return MinigameThumbnail(
            title: items[index],
            navigationRoute: navigationRoutes[index],
            image: images[index]);}),
      ),
    );
  }
}