import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'symbol.dart';

class FruitGamblingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/minigames/background/background_main.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: FruitGambling(),
          ),
        ),
      ),
    );
  }
}

class FruitGambling extends StatefulWidget {
  @override
  _FruitGamblingState createState() => _FruitGamblingState();
}

class _FruitGamblingState extends State<FruitGambling> {
  static const int numRows = 4;
  static const int numColumns = 5;

  List<Symbol> availableSymbols = [
    Symbol("assets/images/minigames/symbols/symbol1.png", 0.5),
    Symbol("assets/images/minigames/symbols/symbol2.png", 0.7),
    Symbol("assets/images/minigames/symbols/symbol3.png", 0.9),
    Symbol("assets/images/minigames/symbols/symbol4.png", 1.3),
    Symbol("assets/images/minigames/symbols/symbol5.png", 1.5),
  ];

  late List<List<Symbol>> symbols;

  bool isSpinning = false;
  List<Timer?> _timers = [];

  String resultText = '';
  double betAmount = 10.0;
  double balance = 100.0;

  _FruitGamblingState() {
    symbols = List.generate(numRows, (_) => List.generate(numColumns, (index) => availableSymbols[index % availableSymbols.length]));
  }

  void spin() {
    if (!isSpinning && balance >= betAmount) {
      setState(() {
        isSpinning = true;
        resultText = '';
        balance -= betAmount;
      });

      _timers.forEach((timer) => timer?.cancel());
      _timers.clear();

      const int spinDuration = 200;
      for (int column = 0; column < numColumns; column++) {
        Future.delayed(Duration(milliseconds: spinDuration * column), () {
          Timer? timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
            setState(() {
              for (int row = 0; row < numRows; row++) {
                symbols[row][column] = getRandomSymbol();
              }
            });
          });
          _timers.add(timer);

          Future.delayed(Duration(seconds: 1), () {
            timer.cancel();
            if (column == numColumns - 1) {
              setState(() {
                isSpinning = false;
                checkCombinations();
              });
            }
          });
        });
      }
    }
  }

  void increaseBet() {
    if (!isSpinning && betAmount + 10 <= balance) {
      setState(() {
        betAmount += 10.0;
      });
    } else if (!isSpinning && betAmount + 10 > balance) {
      setState(() {
        betAmount = balance;
      });
    }
  }

  void decreaseBet() {
    if (!isSpinning && betAmount > 10.0) {
      setState(() {
        betAmount -= betAmount % 10 == 0 ? 10.0 : betAmount % 10;
      });
    }
  }

  Symbol getRandomSymbol() {
    Random random = Random();
    return availableSymbols[random.nextInt(availableSymbols.length)];
  }

  void checkCombinations() {
    double totalWin = 0.0;

    for (int row = 0; row < numRows; row++) {
      totalWin += checkRowCombination(symbols[row]);
    }

    if (totalWin > 0) {
      setState(() {
        balance += totalWin;
        resultText = 'Вы выиграли $totalWin!';
      });
    } else {
      setState(() {
        resultText = 'Вы проиграли!';
      });
    }
  }

  double checkRowCombination(List<Symbol> row) {
    double rowWin = 0.0;

    for (int i = 0; i < numColumns - 2; i++) {
      Symbol symbol = row[i];
      if (symbol.weight != 0.0 && row[i + 1].imagePath == symbol.imagePath && row[i + 2].imagePath == symbol.imagePath) {
        rowWin += symbol.weight * betAmount;
      }
    }

    return rowWin;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Отображение баланса и ставки
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Баланс: $balance',
                  style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
                ),
              ),
              SizedBox(width: screenWidth * 0.1),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Ставка: $betAmount',
                  style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.05),
          // Символы слот-машины
          SizedBox(
            height: screenWidth * 0.8,
            child: Column(
              children: List.generate(
                numRows,
                    (rowIndex) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    numColumns,
                        (columnIndex) => Container(
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      margin: EdgeInsets.all(screenWidth * 0.005),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      child: Image.asset(
                        symbols[rowIndex][columnIndex].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.05),
          // Рамочка для текста "Вы выиграли" или "Вы проиграли"
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              resultText,
              style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(height: screenWidth * 0.25),
          // Кнопки управления ставками и спином
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Уменьшение ставки
              ElevatedButton(
                onPressed: isSpinning ? null : decreaseBet,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                ),
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/minigames/background/decrease.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // Кнопка спина
              ElevatedButton(
                onPressed: isSpinning ? null : spin,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: CircleBorder(),
                ),
                child: Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/minigames/background/background_spin.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // Увеличение ставки
              ElevatedButton(
                onPressed: isSpinning ? null : increaseBet,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                ),
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/minigames/background/increase.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timers.forEach((timer) => timer?.cancel());
    super.dispose();
  }
}