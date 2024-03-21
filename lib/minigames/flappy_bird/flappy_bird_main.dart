import 'dart:async';
import 'dart:math';

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

  double birdWidth = 0.16;
  double birdHeight = 0.16;
  double birdXaxis = 0;
  static double birdYaxis = 0;

  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;

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

      if (barrierX[0] < -1.4) {
        createPairOfBarriers();
      }
      barrierX[0] -= 0.05;
      barrierX[0] = roundDouble(barrierX[0], 2, 100);
      barrierX[1] -= 0.05;
      barrierX[1] = roundDouble(barrierX[1], 2, 100);

      if (roundDouble(barrierX[0], 2, 100) == birdXaxis - 0.05 ||
          roundDouble(barrierX[1], 2, 100) == birdXaxis - 0.05) {
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

    if (barrierX[0] <= birdWidth &&
          (barrierX[0] + (barrierWidth)) >= birdWidth &&
          (birdYaxis <= -1 - birdHeight + barrierHeight[0][1] ||
              birdYaxis + birdHeight >= 1.1 + birdHeight - barrierHeight[0][0])) {

        return true;
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
      barrierX[0] = 2;
      barrierX[1] = barrierX[0] + 2;
      barrierHeight = [
        [1, 0.5],
        [0.65, 0.9]
      ];
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "S C O R E: $score",
                style: const TextStyle(color: Colors.white),
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
      onTap: gameHasStarted ? jump : startGame,
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
                  showBarrier(barrierX[0], true, barrierHeight[0][0], barrierWidth),
                  showBarrier(barrierX[0], false, barrierHeight[0][1], barrierWidth),
                  showBarrier(barrierX[1], true, barrierHeight[1][0], barrierWidth),
                  showBarrier(barrierX[1], false, barrierHeight[0][1], barrierWidth),
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
                        ),
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

  void createPairOfBarriers() {
    double rndOffset = roundDouble(Random().nextDouble() - 0.4, 2, 100);
    bool rndDirection = Random().nextBool(); //true - up, false - down
    bool correctedDirection = rndDirection;
    if (barrierHeight.last[0] - rndOffset <= 0 && !rndDirection) {
      correctedDirection = true;
    } else if (barrierHeight.last[1] - rndOffset <= 0 && rndDirection) {
      correctedDirection = false;
    }
    double newHone = correctedDirection ? barrierHeight.last[0] + rndOffset : barrierHeight.last[0] - rndOffset;
    double newHtwo = correctedDirection ? barrierHeight.last[1] - rndOffset : barrierHeight.last[1] + rndOffset;
    List<double> newHeights = [newHone, newHtwo];

    barrierHeight.removeAt(0);
    barrierX.removeAt(0);

    barrierHeight.add(newHeights);
    barrierX.add(barrierX.last + 2);
  }

}
