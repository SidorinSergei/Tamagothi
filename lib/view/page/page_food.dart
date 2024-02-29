import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/scale.dart';

// Модель - содержит данные и бизнес-логику
class FoodPageModel {
  final String petSkin;
  double foodValue;

  FoodPageModel({required this.petSkin, required this.foodValue});
  void addFood(double value) {
    foodValue += value;
    if (foodValue > 100) foodValue = 100;
  }
}

class FoodPage extends StatefulWidget {
  final FoodPageModel model;

  FoodPage({required this.model});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/food_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: screenSize.width * 0.095,
                top: screenSize.height * 0.23,
                child: Image.asset(
                  widget.model.petSkin,
                  width: screenSize.width * 0.83,
                  height: screenSize.height * 0.83,
                ),
              ),
              HealthScale(
                value: widget.model.foodValue,
                size: 0.23,
                leftSize: 0.39,
                topSize: 0.07,
                petImage: Image.asset(
                  'assets/images/food.png',
                  width: screenSize.width * 0.23,
                  height: screenSize.height * 0.23,
                ),
              ),
              // Прокручиваемый список еды
              Positioned(
                left: screenSize.width * 0.1,
                top: screenSize.height * 0.8,
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.13,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FoodItem(
                      imagePath: 'assets/images/food_1.png',
                      onFoodTap: () {
                        setState(() {
                          widget.model.addFood(5);
                        });
                      },
                    ),
                    FoodItem(
                      imagePath: 'assets/images/food_2.png',
                      onFoodTap: () {
                        setState(() {
                          widget.model.addFood(10);
                        });
                      },
                    ),
                    FoodItem(
                      imagePath: 'assets/images/food_3.png',
                      onFoodTap: () {
                        setState(() {
                          widget.model.addFood(12);
                        });
                      },
                    ),
                    FoodItem(
                      imagePath: 'assets/images/food_4.png',
                      onFoodTap: () {
                        setState(() {
                          widget.model.addFood(14);
                        });
                      },
                    ),
                    FoodItem(
                      imagePath: 'assets/images/food_5.png',
                      onFoodTap: () {
                        setState(() {
                          widget.model.addFood(16);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imagePath;
  final VoidCallback onFoodTap;

  FoodItem({required this.imagePath, required this.onFoodTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFoodTap,
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 550,
        ),
      ),
    );
  }
}
