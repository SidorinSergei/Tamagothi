import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tamagothi/model/model_skin.dart';
import 'package:tamagothi/presenter/presenter.dart';
import 'package:tamagothi/swagger_generated_api/app_api.swagger.dart';
import 'package:tamagothi/view/widgets/scale.dart';
import 'package:tamagothi/network_service.dart';

class FoodPage extends StatefulWidget {
  final FoodPageModel model;

  FoodPage({required this.model});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late FoodPageController _controller;
  NetworkService ns = NetworkService();

  List<FoodDetail>? foodDetails;
  List<UserStorageFoodDetail>? userStorageFood;


  Future<List<FoodDetail>> _getFoodDetails() async {
    return await ns.fetchFoodData();
  }

  Future<List<UserStorageFoodDetail>> _getUserStorageFood() async {
    return await ns.fetchUserStorageFoodData();
  }


  @override
  void initState() {
    super.initState();
    _getFoodDetails().then((fetchedDetails) {
      setState(() {
        foodDetails = fetchedDetails;
        _controller.list = foodDetails!.map((foodDetail) => FoodItemModel(
          imagePath: 'assets/images/food_${foodDetail.id}.png',
          quantity: 3,
          count: foodDetail.saturation.toDouble(),
        )).toList();
      });
    });
    _controller = FoodPageController(
      model: widget.model,
      list: [],
    );
  }


  void onFoodItemTapped(FoodItemModel foodItem) {
    setState(() {
      _controller.addFood(foodItem);
      _controller.removeEmptyFoodItems();
    });
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/food_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
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
              Positioned(
                left: screenSize.width * 0.095,
                top: screenSize.height * 0.25,
                child: Image.asset(
                  'assets/pers/pers_1.png',
                  width: screenSize.width * 0.83,
                  height: screenSize.height * 0.83,
                ),
              ),
              Positioned(
                left: screenSize.width * 0.1,
                top: screenSize.height * 0.82,
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.13,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.list.length,
                  itemBuilder: (context, index) {
                    final foodItem = _controller.list[index];
                    return GestureDetector(
                      onTap: () => onFoodItemTapped(foodItem),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Image.asset(
                              foodItem.imagePath,
                              width: 100,
                              height: 100,
                            ),
                            Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                foodItem.quantity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
