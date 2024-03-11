import 'dart:async';

import 'package:flutter/material.dart';

import 'bird.dart';

class FlappyBirdMain extends StatefulWidget {
  const FlappyBirdMain({super.key});

  @override
  State<FlappyBirdMain> createState() => _FlappyBirdMainState();
}

class _FlappyBirdMainState extends State<FlappyBirdMain> {
  int score = 0;
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });
      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector (
              onTap: () {
                if (gameHasStarted) {
                  jump();
                } else {
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(-0.5, birdYaxis),
                color: Colors.blue[400],
                duration: const Duration(milliseconds: 50),
                child: const Bird(),
              ),
            )
          ),
          Container(
            height: 15,
            color: Colors.green,
          ),
          Expanded(
              child: Container(
                color: Colors.brown[400],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("SCORE", style: TextStyle(color: Colors.white, fontSize: 24),),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(score.toString(), style: const TextStyle(color: Colors.white, fontSize: 30),)
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
