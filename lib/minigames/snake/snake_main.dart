import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class Snake extends StatefulWidget {
  const Snake({super.key});

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  static List<int> snakePosition = [];
  int numberOfSquares = 450;

  int score = 0;
  bool gameHasStarted = false;


  static var randomNumber = Random();
  int food = randomNumber.nextInt(390);

  void generateNewFood() {
    food = randomNumber.nextInt(390);
  }

  List<int> placeSnake() {
    int first = Random().nextInt(150);
    List<int> position = [];
    for (int i = 0; i < 5; i++) {
      position.add(first + i * 15);
    }
    return position;
  }

  void startGame() {
    snakePosition = placeSnake();
    const duration = Duration(milliseconds: 250);
    Timer.periodic(duration, (timer) {
      updateSnake();
      if (gameOver()) {
        timer.cancel();
        _showGameOverScreen();
      }
    });
    gameHasStarted = true;
  }

  void exit() {

    Navigator.of(context).pop();
  }

  var direction = "down";
  void updateSnake() {
    setState(() {
      switch (direction) {
        case "down":
          if (snakePosition.last > 435) {
            snakePosition.add(snakePosition.last + 15 - 450);
          } else {
            snakePosition.add(snakePosition.last + 15);
          }
          break;

        case "up":
          if (snakePosition.last < 15) {
            snakePosition.add(snakePosition.last - 15 + 450);
          } else {
            snakePosition.add(snakePosition.last - 15);
          }
          break;
        case "left":
          if (snakePosition.last % 15 == 0) {
            snakePosition.add(snakePosition.last - 1 + 15);
          } else {
            snakePosition.add(snakePosition.last - 1);
          }
          break;
        case "right":
          if ((snakePosition.last + 1) % 15 == 0) {
            snakePosition.add(snakePosition.last + 1 - 15);
          } else {
            snakePosition.add(snakePosition.last + 1);
          }
          break;

        default:
      }

      if (snakePosition.last == food) {
        generateNewFood();
      } else {
        snakePosition.removeAt(0);
      }
    });
  }

  bool gameOver() {
    for (int i = 0; i < snakePosition.length; i++) {
      int count = 0;
      for (int j = 0; j < snakePosition.length; j++) {
        if (snakePosition[i] == snakePosition[j]) {
          count += 1;
        }
        if (count == 2) {
          gameHasStarted = false;
          return true;
        }
      }
    }
    return false;
  }

  void _showGameOverScreen() {
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("G A M E  O V E R"),
            content: Text("S C O R E :  ${snakePosition.length - 5}"),
            actions: [
              ElevatedButton(
                child: const Text("P L A Y  A G A I N"),
                onPressed: () {
                  startGame();
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Text("G O  T O  M E N U"),
                onPressed: () {
                  startGame();
                  Navigator.pushNamed(context, '/page_minigames');
                },
              )
            ],
          );
        }
    );
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (direction != "up" && details.delta.dy > 0) {
                    direction = "down";
                  } else if (direction != "down" && details.delta.dy < 0) {
                    direction = "up";
                  }
                },

                onHorizontalDragUpdate: (details) {
                  if (direction != "left" && details.delta.dx > 0) {
                    direction = "right";
                  } else if (direction != "right" && details.delta.dx < 0) {
                    direction = "left";
                  }
                },

                child: Container(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 15
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (snakePosition.contains(index)) {
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                      if (index == food) {
                        return Container(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(color: Colors.green),
                          ),
                        );
                      } else {
                        return Container(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(color: Colors.grey[900]),
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: gameHasStarted ? exit : startGame,
                  child: gameHasStarted ?
                  const Text(
                    "e x i t",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ) : const Text(
                    "s t a r t",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Text(
                  "s c o r e :  ${snakePosition.length - 5}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
