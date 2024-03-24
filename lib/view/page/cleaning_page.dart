import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/scale.dart';
import 'package:tamagothi/network_service.dart';

class WashPage extends StatefulWidget {
  @override
  _WashPageState createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  Offset startPosition = Offset.zero; // Исходная позиция губки
  Offset position = Offset.zero; // Текущая позиция губки
  bool isCleaning = false; // Флаг "мытья"
  NetworkService ns = NetworkService();
  bool _isLoading = true;
  var purityPoints;

  void _initializeData() {
    ns.statesPet('purityPoints','8').then((result){
      setState(() {
        purityPoints = result?.toDouble();
        _isLoading = false; // Update the loading state
      });
      });
  }
  double cumulativeChange = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
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
            if(purityPoints<=100) {
              double previousPoints = purityPoints;
              purityPoints += 0.005;
              cumulativeChange += purityPoints - previousPoints;
            }
            if (cumulativeChange >= 1) {
              int changeToInt = cumulativeChange.toInt();
              ns.increasingStates("purity", 8, changeToInt);
              cumulativeChange -= changeToInt;
            }
            position = details.localPosition;
            isCleaning = characterRect.contains(position);
          });
        },
        onPanEnd: (details) {
          setState(() {
            position = startPosition;
            isCleaning = false;
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
            if(_isLoading==false)
            HealthScale(
              value: purityPoints,
              size: 0.23,
              leftSize: 0.39,
              topSize: 0.07,
              petImage: Image.asset(
                'assets/images/washing.png',
                width: screenSize.width * 0.23,
                height: screenSize.height * 0.23,
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

                    (purityPoints >= 100) ? 'Чист' : 'Очищаю...',
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
