import "swagger_generated_api/app_api.swagger.dart";

class NetworkService {
  late final AppApi api;

  NetworkService() {
    _initialize();
  }

  void _initialize() async {
    api = AppApi.create();
  }

  Future<List<UserStorageFoodDetail>> fetchUserStorageFoodData() async {
    final response = await api.userStorageFoodGet();
    late List<UserStorageFoodDetail> foods = [];
    if (response.isSuccessful) {
      foods = response.body ?? [];
    }
    return foods;
  }

  Future<List<FoodDetail>> fetchFoodData() async {
    final response = await api.foodGet();
    late List<FoodDetail> foods = [];
    if (response.isSuccessful) {
      foods = response.body ?? [];
    }
    return foods;
  }
}


