import 'package:tamagothi/model/model_skin.dart';

class ShopPresenter {
  final ShopModel model = ShopModel();
  Function(bool)? onUpdate;


  ShopPresenter({this.onUpdate});

  void onSkinDoubleTapped(int index) {
    bool success = model.buySkin(index);
    if (onUpdate != null) onUpdate!(success);
  }


  int get coins => model.coins;
  Set<int> get purchasedSkins => model.purchasedSkins;
}

class FoodPageController {
  FoodPageModel model;
  List<FoodItemModel> list;

  FoodPageController({required this.model, required this.list});

  void addFood(FoodItemModel foodItem) {
    if (foodItem.consume()) {
      model.addFood(foodItem.count);
    }
  }

  void addToStorage(FoodItemModel foodItem) {
    foodItem.buy();
  }

  void removeEmptyFoodItems() {
    list.removeWhere((item) => item.quantity == 0);
  }
}


