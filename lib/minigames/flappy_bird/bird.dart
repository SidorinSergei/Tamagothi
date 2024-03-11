import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: Image.asset(
        "assets/images/minigames/bird.png"
      ),
    );
  }
}
