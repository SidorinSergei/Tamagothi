
import "dart:async";

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

  Future<void> createPet(String name, int user, int age, bool gender, int? skinId) async{
    final PetDetail newPet = PetDetail(
        name: name,
        user: user,
        age: age,
        isMale: gender,
        moodPoints: 50,
        purityPoints: 50,
        starvationPoints:50,
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

  Future<AuthenticationCodeVerify?> createUserProfile(String phoneNumber, String code) async {
    final authCodeVerifyData = await AuthenticationCodeVerify(phoneNumber: phoneNumber, code: code);
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

  Future<List<UserDetail>> users(String phone) async{
    final user =await api.userProfilesGet();
    return user.body!;
  }
  Future<List<UserDetail>> userBalance()async{
    final response =await api.userProfilesGet();
    late List<UserDetail> userList=[];
    if (response.isSuccessful) {
      userList = response.body ?? [];
    }
    return userList;
  }
  Future<bool> isPhoneNumberInList(String phoneNumber) async {
    final List<UserDetail> userList = await users(phoneNumber);
    return userList.any((user) => user.phoneNumber == phoneNumber);
  }

  Future<bool> isPhoneNumberInListSync(String phoneNumber) async {
    return await isPhoneNumberInList(phoneNumber);
  }

  Future<int?> statesPet(String fieldName,String id) async {
    final user = await api.petsIdGet(id: id);
    switch (fieldName) {
      case 'moodPoints':
        return user.body!.moodPoints;
      case 'purityPoints':
        return user.body!.purityPoints;
      case 'starvationPoints':
        return user.body!.starvationPoints;
      default:
        return null;
    }
  }

  void increasingStates(String characteristic, int petId,int value) async{
    final PetPointsIncrease data = PetPointsIncrease(petId: petId, characteristic: characteristic, value: value);
    try {
      final increasingStates = await api.petsIncreasePost(data: data);
      if (increasingStates.isSuccessful) {
        //print("отправлено");
      } else {
        print("Ошибка при отправке: ${increasingStates.error}");
      }
    } catch (e) {
      print("Exception при отправке: $e");
    }
  }

  Future<List<UserDetail>> fetchUserIdByPhoneNumberData(String phoneNumber) async {
    final response = await api.userProfilesGet();
    late List<UserDetail> users = [];
    if (response.isSuccessful) {
      users = response.body ?? [];
    }
    return users;
  }

  Future<void> updateUserStorageFoodData(UserStorageFoodDetail? data, String? id) async {
    await api.userStorageFoodIdPut(data: data, id: id);
  }


  Future<List<PetDetail>> fetchPetsData() async {
    final response = await api.petsGet();
    late List<PetDetail> pets = [];
    if (response.isSuccessful) {
      pets = response.body ?? [];
    }
    return pets;

  }

  Future<List<SkinDetail>> skins() async{
    final response = await api.skinGet();
    late List<SkinDetail> skins=[];
    if (response.isSuccessful) {
      skins = response.body ?? [];
    }
    return skins;
  }

  Future<List<UserStorageSkinDetail>> userSkinId() async{
    final response = await api.userStorageSkinGet();
    List<UserStorageSkinDetail> skin = [];
    if (response.isSuccessful) {
      skin = response.body ?? [];
    }
    return skin;
  }

  Future<bool> buySkin(int user,int skin) async{
    final data = await UserStorageSkinDetail(user: user,skin: skin);
    final response = await api.userStorageSkinPost(data: data);
    if(response.isSuccessful)
      return true;
    else false;
    return false;
  }

  Future<int?> updateBalance(int id, int balance)async{
    //final data = await UserDetail(id: ,phoneNumber: ,balance: ,name: )
    final data = await UserEditBalance(id: id,balance: balance);

    //api.userProfilesIdPut(data: data, id: id)
    final response = await api.userProfilesEditBalancePost(data: data);
    return response.body!.balance;
  }

}