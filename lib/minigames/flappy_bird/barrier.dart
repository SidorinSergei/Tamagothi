import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  const Barrier(
      {super.key,
      required this.barrierHeight,
      required this.barrierWidth,
      this.barrierX,
      required this.isBottomBarrier});

  final double barrierHeight;
  final double barrierWidth;
  final barrierX;
  final bool isBottomBarrier;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth),
          (isBottomBarrier ? 1.1 : -1.1)),
      child: Container(
        width: MediaQuery.of(context).size.width * barrierWidth,
        height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
        decoration: BoxDecoration(
            color: Colors.green[400],
            border: Border.all(width: 10, color: Colors.green),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
