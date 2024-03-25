import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tamagothi/model/model_skin.dart';
import 'package:tamagothi/presenter/global.dart';
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
  late final FoodPageController _controller = FoodPageController(
    model: widget.model,
    list: [],
  );
  NetworkService ns = NetworkService();

  List<FoodDetail> storeFoods = [];
  List<FoodDetail> foodDetails = [];
  List<UserStorageFoodDetail> userStorageFood = [];
  List<UserStorageFoodDetail> userExistingStorageFoodData = [];
  List<UserStorageFoodDetail> userMissingStorageFoodData = [];
  bool _isLoading = true;

  Future<List<FoodDetail>> _getFoodDetails() async {
    return await ns.fetchFoodData();
  }

  Future<List<UserStorageFoodDetail>> _getUserStorageFood() async {
    return await ns.fetchUserStorageFoodData();
  }

  void _initializeData() {
    _getUserStorageFood().then((fetchedUserStorageFood) {
      userStorageFood = fetchedUserStorageFood;
      _getFoodDetails().then((fetchedFoodDetails) {
        foodDetails = fetchedFoodDetails;
        _processData();
        setState(() {
          _isLoading = false; // Update the loading state
        });
      });
    });
  }

  Future<bool> isFileExist(String filePath) async {
    bool fileExists = await ns.checkIfFileExists(filePath);
    return fileExists;
  }

  //TODO: выдать юзеру при регистрации всю еду (посмотреть, какая отсутствует)


  Future<void> getValidFood(String filePath, FoodDetail foodDetail, int index) async {
    if (await ns.checkIfFileExists(filePath)) {
      storeFoods.add(foodDetail);
    }
  }

  void _processData() {
    userExistingStorageFoodData = userStorageFood
        .where((foodDetails) => foodDetails.user.toString() == USER_ID)
        .toList();
    for (var foodData in userExistingStorageFoodData) {
      FoodDetail? userFood =
          foodDetails.firstWhere((element) => element.id == foodData.food);

      var item = FoodItemModel(
        id: userFood.id!,
        imagePath: 'assets/images/food_${userFood.id}.png',
        quantity: foodData.count!.toInt(),
        count: userFood.saturation.toDouble(),
      );
      _controller.list.add(item);
    }
    for (int i = 0; i < foodDetails.length; i++) {
      getValidFood('assets/images/food_${foodDetails[i].id}.png', foodDetails[i], i);
    }

  }

  void buyFood(FoodDetail foodItem) {
    UserStorageFoodDetail data = UserStorageFoodDetail();
    FoodItemModel item = _controller.list.firstWhere((element) => element.id == foodItem.id);

    data.id = userExistingStorageFoodData.firstWhere((element) => element.food == foodItem.id).id;
    data.count = item.quantity + 1;
    data.user = int.parse(USER_ID!);
    data.food = foodItem.id;

    setState(() {
      _controller.addToStorage(item);
      ns.buyFoodPost(data, 0);
      if ((BALANCE! - foodItem.price) >= 0) {
        ns.updateBalance(int.parse(USER_ID!), (BALANCE! - foodItem.price));
        BALANCE = (BALANCE! - foodItem.price);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void onFoodItemTapped(FoodItemModel foodItem) {
    setState(() {
      _controller.addFood(foodItem);
      _controller.removeEmptyFoodItems();
    });
    List<UserStorageFoodDetail> foodDetails = userStorageFood
        .where((element) => element.user == int.parse(USER_ID!))
        .toList();
    RegExp regExp = RegExp(r'\d+');
    var match = regExp.firstMatch(foodItem.imagePath);
    String? foodId = match?.group(0);
    UserStorageFoodDetail? firstFood =
        foodDetails.firstWhere((element) => element.food == int.parse(foodId!));
    firstFood.count = foodItem.quantity;
    ns.updateUserStorageFoodData(firstFood, firstFood.id.toString());
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
              Positioned(
                  left: screenSize.width * 0.0,
                  top: screenSize.height * 0.1,
                  width: screenSize.width * 1.0,
                  height: screenSize.height * 0.1,
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/store_shelf.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: storeFoods.length,
                            itemBuilder: (context, index) {
                              final foodItem = storeFoods[index];
                              return GestureDetector(
                                onTap: () => buyFood(foodItem),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 15),
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/food_${foodItem.id}.png',
                                        width: 80,
                                        height: 75,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(3.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          foodItem.price.toString(),
                                          style: const TextStyle(
                                            color: Colors.black54,
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
                        )),
              HealthScale(
                value: 20,
                size: 0.23,
                leftSize: 0.39,
                topSize: 0.17,
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
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
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
