import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird(
      {super.key,
      this.birdY,
      required this.birdWidth,
      required this.birdHeight});

  final birdY;
  final double birdWidth;
  final double birdHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2 * birdY + birdHeight) / (2 - birdHeight)),
      width: MediaQuery.of(context).size.width * birdWidth / 2,
      height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight / 2,
      child: Image.asset("assets/images/minigames/bird.png"),
    );
  }
}
