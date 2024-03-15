class Skin {
  final String assetPath;
  final int price;
  bool isPurchased;
  bool isSelected;

  Skin({required this.assetPath, required this.price, this.isPurchased = false, this.isSelected = false});
}

class ShopModel {
  int coins = 100; // Изначальное количество монет
  Set<int> purchasedSkins = Set(); // Индексы купленных скинов

  List<int> prices = [50, 70];
  List<String> images = [
    'assets/pers/pers_1.png',
    'assets/pers/pers_2.png',
  ];

  bool buySkin(int index) {
    if (coins >= prices[index]) {
      coins -= prices[index]; // Вычитаем стоимость из общего количества монет
      purchasedSkins.add(index); // Добавляем скин в набор купленных
      return true; // Покупка успешна
    }
    return false; // Недостаточно средств
  }
}

