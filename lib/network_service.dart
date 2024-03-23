import "swagger_generated_api/app_api.swagger.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  void createPet(String name, int user,int age,bool male, int? skinId) async{
    final PetDetail newPet = PetDetail(name: name, user: user,age: age,isMale: male,moodPoints: 100,purityPoints: 100,starvationPoints: 0,personality: skinId);
    try {
      final response = await api.petsPost(data: newPet);
      if (response.isSuccessful) {
        // Успешная отправка, обработайте ответ
        print("Питомец успешно создан");
      } else {
        // Обработайте ошибку
        print("Ошибка при создании питомца: ${response.error}");
      }
    } catch (e) {
      print("Exception при создании питомца: $e");
    }
  }

  void sendAuthCode(String phone) async {
    // Создание объекта AuthenticationCodeSend
    AuthenticationCodeSend data = AuthenticationCodeSend(phoneNumber: phone);
    print(data.phoneNumber);
    // Вызов функции authCodeSendPost и ожидание ответа
    var response = await api.authCodeSendPost(data: data);
    print(response);
  }

  Future<void> sendVerificationCode(String phoneNumber) async {
    final authCodeSendData = AuthenticationCodeSend(phoneNumber: phoneNumber);

    final response = await api.authCodeSendPost(data: authCodeSendData);
    if (response.isSuccessful && response.body != null) {
      print('Verification code sent successfully');
      print(response.body);
    } else {
      print('Failed to send verification code with status code: ${response.statusCode}');
      if (response.error != null) {
        print('Error: ${response.error}');
      }
    }
  }
}


