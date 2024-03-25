import 'package:flutter/material.dart';
import 'package:tamagothi/presenter/global.dart';
import 'package:tamagothi/view/widgets/scale.dart';
import 'package:tamagothi/network_service.dart'; // Убедитесь, что у вас есть необходимый импорт для NetworkService

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NetworkService ns = NetworkService(); // Экземпляр сервиса для работы с сетью

  double foodValue = 0.0;
  double purityValue = 0.0;
  double moodValue = 0.0;
  bool _isLoading = true;
  bool _isLoading1 = true;
  bool _isLoading2 = true;

  // Пример метода для обновления значений (может быть вызван, например, по таймеру или в ответ на действия пользователя)
  void _initializeData() async {
    await ns.statesPet('purityPoints',petId!).then((result){
      setState(() {
        purityValue = result!.toDouble();
        _isLoading = false; // Update the loading state
      });
    });
   await ns.statesPet('starvationPoints',petId!).then((result){
      setState(() {
        foodValue = result!.toDouble();
        _isLoading1 = false; // Update the loading state
      });
    });
    await ns.statesPet('moodPoints',petId!).then((result){
      setState(() {
        moodValue = result!.toDouble();
        _isLoading2 = false; // Update the loading state
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/background_home_page.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(left: screenSize.width*0.095, top: screenSize.height*(-0.07), child: Image.asset('assets/pers/pers_1.png',width: screenSize.width*0.83,height: screenSize.height*0.83,),),
              if(_isLoading==false)HealthScale(value: foodValue, size: 0.23, leftSize: 0.06, topSize: 0.52, petImage: Image.asset('assets/images/food.png', width: screenSize.width*0.23, height: screenSize.height*0.23,),),
              if(_isLoading1==false)HealthScale(value: purityValue, size: 0.23, leftSize: 0.385, topSize: 0.52, petImage: Image.asset('assets/images/washing.png', width: screenSize.width*0.23, height: screenSize.height*0.23,),),
              if(_isLoading2==false)HealthScale(value: moodValue, size: 0.23, leftSize: 0.7, topSize: 0.52, petImage: Image.asset('assets/images/sleep.png', width: screenSize.width*0.23, height: screenSize.height*0.23,),),
              // Добавьте здесь другие виджеты, такие как кнопки для вызова _updateValues
            ],
          ),
        ),
      ),
    );
  }
}
