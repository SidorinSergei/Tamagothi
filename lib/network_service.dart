import "dart:convert";

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

  void createPet(String name, int user, int age, bool gender, int? skinId) async{
    final PetDetail newPet = PetDetail(
        name: name,
        user: user,
        age: age,
        isMale: gender,
        moodPoints: 100,
        purityPoints: 100,
        starvationPoints: 0,
        personality: skinId
    );
    try {
      final response = await api.petsPost(data: newPet);
      if (response.isSuccessful) {
        print("Питомец успешно создан");
      } else {
        print("Ошибка при создании питомца: ${response.error}");
      }
    } catch (e) {
      print("Exception при создании питомца: $e");
    }
  }

  Future<AuthenticationCodeSend?> fetchAuthCodeSendPost(String phoneNumber) async {
    AuthenticationCodeSend? data = AuthenticationCodeSend(phoneNumber: phoneNumber);
    final response = await api.authCodeSendPost(data: data);
    late AuthenticationCodeSend? code;
    if (response.isSuccessful) {
      code = response.body;
      print(code);
    }

    return code;
  }

  Future<AuthenticationCodeSend?> sendVerificationCode(String phoneNumber) async {
    final authCodeSendData = AuthenticationCodeSend(phoneNumber: phoneNumber);

    final response = await api.authCodeSendPost(data: authCodeSendData);
    if (response.isSuccessful && response.body != null) {
      print('Verification code sent successfully');
      return response.body;
    } else {
      print('Failed to send verification code with status code: ${response.statusCode}');
      if (response.error != null) {
        print('Error: ${response.error}');
      }
    }
    return null;
  }

  Future<AuthenticationCodeVerify?> test(String phoneNumber, String code) async {
    final authCodeVerifyData = AuthenticationCodeVerify(phoneNumber: phoneNumber, code: code);
    final response = await api.authCodeVerifyPost(data: authCodeVerifyData);
    if (response.isSuccessful && response.body != null) {
      print('Verification code received successfully');
      return response.body;
    } else {
      print('Failed to send verification code with status code: ${response.statusCode}');
      if (response.error != null) {
        print('Error: ${response.error}');
      }
    }
    return null;
  }

// void createUserProfile(String phoneNumber) async {
//   UserDetail? data = UserDetail(name: "TEST", phoneNumber: phoneNumber, balance: 100);
//   final response = await api.userProfilesPost(data: data);
//   print(response.body);
// }
}