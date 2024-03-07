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
