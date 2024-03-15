import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tamagothi/minigames/flappy_bird/barrier.dart';

import 'bird.dart';

class FlappyBirdMain extends StatefulWidget {
  const FlappyBirdMain({super.key});

  @override
  State<FlappyBirdMain> createState() => _FlappyBirdMainState();
}

class _FlappyBirdMainState extends State<FlappyBirdMain> {
  int millsnds = 50;
  int score = 0;

  double birdWidth = 0.32;
  double birdHeight = 0.32;
  double birdXaxis = 0;
  static double birdYaxis = 0;

  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;
  static double barrierXone = 2;
  double barrierXtwo = barrierXone + 2;

  static List<double> barrierX = [2, 2 + 2];
  static double barrierWidth = 0.25;
  static List<List<double>> barrierHeight = [
    [1, 0.5],
    [0.65, 0.9]
  ];

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: millsnds), (timer) {
      time += 0.05;
      height = -5 * time * time + 2.5 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      if (birdIsDead()) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog();
      }

      if (barrierXone < -1.4) {
        barrierXone += 4;
      } else {
        barrierXone -= 0.05;
      }
      if (barrierXtwo < -1.4) {
        barrierXtwo += 4;
      } else {
        barrierXtwo -= 0.05;
      }
      if (roundDouble(barrierXone, 2, 100) == birdXaxis - 0.05 ||
          roundDouble(barrierXtwo, 2, 100) == birdXaxis - 0.05) {
        score += 1;
      }
    });
  }

  double roundDouble(double num, int decimals, int factor) {
    return (num * factor).round() / factor;
  }

  bool birdIsDead() {
    if (birdYaxis > 1 || birdYaxis < -1) {
      return true;
    }


    // for (int i = 0; i < barrierX.length; i++) {
    //   if (birdYaxis <= -1 + barrierHeight[i][0] ||
    //       birdYaxis + birdHeight >= 1 - barrierHeight[i][1]) {
    //     return true;
    //   }
    // }

    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          barrierX[i] + barrierWidth >= -birdWidth &&
          (birdYaxis <= -1 + barrierHeight[i][0] ||
              birdYaxis + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }

    return false;
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      score = 0;
      birdYaxis = 0;
      gameHasStarted = false;
      time = 0;
      initialHeight = birdYaxis;
      barrierXone = 2;
      barrierXtwo = barrierXone + 2;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Center(
              child: Text(
                "G A M E  O V E R",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    color: Colors.white,
                    child: const Text(
                      "PLAY AGAIN",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(birdXaxis, birdYaxis),
                    color: Colors.blue[400],
                    duration: Duration(milliseconds: millsnds),
                    child: Bird(
                      birdY: 0,
                      birdHeight: birdHeight,
                      birdWidth: birdWidth,
                    ),
                  ),
                  Container(
                      alignment: const Alignment(0, -0.3),
                      child: gameHasStarted
                          ? const Text(" ")
                          : const Text(
                              "T A P  T O  P L A Y",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            )),
                  showBarrier(barrierXone, true, barrierHeight[0][0], barrierWidth),
                  showBarrier(barrierXone, false, barrierHeight[0][1], barrierWidth),
                  showBarrier(barrierXtwo, true, barrierHeight[1][0], barrierWidth),
                  showBarrier(barrierXtwo, false, barrierHeight[0][1], barrierWidth),
                ],
              ),
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
                    const Text(
                      "SCORE",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      score.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget showBarrier(
      double barrier, bool isBottom, double height, double width) {
    return AnimatedContainer(
      duration: Duration(milliseconds: millsnds),
      child: Barrier(
          barrierX: barrier,
          isBottomBarrier: isBottom,
          barrierHeight: height,
          barrierWidth: width),
    );
  }
}
