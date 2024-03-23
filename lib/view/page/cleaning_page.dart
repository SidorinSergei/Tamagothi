import 'package:flutter/material.dart';

class WashPage extends StatefulWidget {
  @override
  _WashPageState createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  Offset startPosition = Offset.zero; // Исходная позиция губки
  Offset position = Offset.zero; // Текущая позиция губки
  bool isCleaning = false; // Флаг "мытья"

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _setStartPosition());
  }

  void _setStartPosition() {
    final screenSize = MediaQuery.of(context).size;
    startPosition = Offset(screenSize.width / 2, screenSize.height - (screenSize.height * 0.1));
    position = startPosition;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final characterRect = Rect.fromLTWH(screenSize.width * 0.1, screenSize.height * 0.2, screenSize.width * 0.8, screenSize.height * 0.6);

    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position = details.localPosition;
            isCleaning = characterRect.contains(position);
          });
        },
        onPanEnd: (details) {
          setState(() {
            position = startPosition; // Возвращаем губку на начальную позицию
            isCleaning = false; // Сбрасываем флаг "мытья"
          });
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/page/cleaning_page.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.095,
              top: screenSize.height * 0.25,
              child: Image.asset(
                'assets/pers/pers_1.png',
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.6,
              ),
            ),
            if (isCleaning)
              Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.black54,
                  child: Text(
                    'Очищаю...',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            Positioned(
              left: position.dx - (screenSize.width * 0.115),
              top: position.dy - (screenSize.height * 0.115),
              child: Image.asset(
                'assets/images/sponge.png',
                width: screenSize.width * 0.23,
                height: screenSize.height * 0.23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
