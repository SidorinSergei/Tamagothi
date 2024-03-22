// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDetail _$AdminDetailFromJson(Map<String, dynamic> json) => AdminDetail(
      id: json['id'] as int?,
      login: json['login'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AdminDetailToJson(AdminDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'password': instance.password,
    };

AuthenticationCodeSend _$AuthenticationCodeSendFromJson(
        Map<String, dynamic> json) =>
    AuthenticationCodeSend(
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$AuthenticationCodeSendToJson(
        AuthenticationCodeSend instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
    };

AuthenticationCodeVerify _$AuthenticationCodeVerifyFromJson(
        Map<String, dynamic> json) =>
    AuthenticationCodeVerify(
      phoneNumber: json['phone_number'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$AuthenticationCodeVerifyToJson(
        AuthenticationCodeVerify instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'code': instance.code,
    };

BuyFood _$BuyFoodFromJson(Map<String, dynamic> json) => BuyFood(
      user: json['user'] as int?,
      food: json['food'] as int?,
    );

Map<String, dynamic> _$BuyFoodToJson(BuyFood instance) => <String, dynamic>{
      'user': instance.user,
      'food': instance.food,
    };

UserStorageSkinDetail _$UserStorageSkinDetailFromJson(
        Map<String, dynamic> json) =>
    UserStorageSkinDetail(
      id: json['id'] as int?,
      user: json['user'] as int,
      skin: json['skin'] as int,
    );

Map<String, dynamic> _$UserStorageSkinDetailToJson(
        UserStorageSkinDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'skin': instance.skin,
    };

CategoryDetail _$CategoryDetailFromJson(Map<String, dynamic> json) =>
    CategoryDetail(
      id: json['id'] as int?,
      categoryName: json['category_name'] as String,
    );

Map<String, dynamic> _$CategoryDetailToJson(CategoryDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
    };

CategoryFoodDetail _$CategoryFoodDetailFromJson(Map<String, dynamic> json) =>
    CategoryFoodDetail(
      category: json['category'] as int,
      food: json['food'] as int,
    );

Map<String, dynamic> _$CategoryFoodDetailToJson(CategoryFoodDetail instance) =>
    <String, dynamic>{
      'category': instance.category,
      'food': instance.food,
    };

FoodDetail _$FoodDetailFromJson(Map<String, dynamic> json) => FoodDetail(
      id: json['id'] as int?,
      name: json['name'] as String,
      price: json['price'] as int,
      saturation: json['saturation'] as int,
    );

Map<String, dynamic> _$FoodDetailToJson(FoodDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'saturation': instance.saturation,
    };

GameDetail _$GameDetailFromJson(Map<String, dynamic> json) => GameDetail(
      id: json['id'] as int?,
      points: json['points'] as int,
      user: json['user'] as int?,
    );

Map<String, dynamic> _$GameDetailToJson(GameDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'user': instance.user,
    };

PersonalityDetail _$PersonalityDetailFromJson(Map<String, dynamic> json) =>
    PersonalityDetail(
      id: json['id'] as int?,
      personality: json['personality'] as String,
      category: json['category'] as int?,
    );

Map<String, dynamic> _$PersonalityDetailToJson(PersonalityDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'personality': instance.personality,
      'category': instance.category,
    };

PetDetail _$PetDetailFromJson(Map<String, dynamic> json) => PetDetail(
      id: json['id'] as int?,
      name: json['name'] as String,
      age: json['age'] as int?,
      isMale: json['is_male'] as bool?,
      moodPoints: json['mood_points'] as int?,
      purityPoints: json['purity_points'] as int?,
      starvationPoints: json['starvation_points'] as int?,
      user: json['user'] as int,
      personality: json['personality'] as int?,
    );

Map<String, dynamic> _$PetDetailToJson(PetDetail instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'is_male': instance.isMale,
      'mood_points': instance.moodPoints,
      'purity_points': instance.purityPoints,
      'starvation_points': instance.starvationPoints,
      'user': instance.user,
      'personality': instance.personality,
    };

PetPointsIncrease _$PetPointsIncreaseFromJson(Map<String, dynamic> json) =>
    PetPointsIncrease(
      petId: json['pet_id'] as int,
      characteristic: json['characteristic'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$PetPointsIncreaseToJson(PetPointsIncrease instance) =>
    <String, dynamic>{
      'pet_id': instance.petId,
      'characteristic': instance.characteristic,
      'value': instance.value,
    };

PetPoints _$PetPointsFromJson(Map<String, dynamic> json) => PetPoints(
      moodPoints: json['mood_points'] as int?,
      purityPoints: json['purity_points'] as int?,
      starvationPoints: json['starvation_points'] as int?,
    );

Map<String, dynamic> _$PetPointsToJson(PetPoints instance) => <String, dynamic>{
      'mood_points': instance.moodPoints,
      'purity_points': instance.purityPoints,
      'starvation_points': instance.starvationPoints,
    };

SkinDetail _$SkinDetailFromJson(Map<String, dynamic> json) => SkinDetail(
      id: json['id'] as int?,
      type: json['type'] as String,
      description: json['description'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$SkinDetailToJson(SkinDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'description': instance.description,
      'price': instance.price,
    };

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt?.toIso8601String(),
      'balance': instance.balance,
    };

UserEditBalance _$UserEditBalanceFromJson(Map<String, dynamic> json) =>
    UserEditBalance(
      id: json['id'] as int,
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$UserEditBalanceToJson(UserEditBalance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
    };

UserSetNick _$UserSetNickFromJson(Map<String, dynamic> json) => UserSetNick(
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserSetNickToJson(UserSetNick instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UserStorageFoodDetail _$UserStorageFoodDetailFromJson(
        Map<String, dynamic> json) =>
    UserStorageFoodDetail(
      id: json['id'] as int?,
      count: json['count'] as int?,
      user: json['user'] as int?,
      food: json['food'] as int?,
    );

Map<String, dynamic> _$UserStorageFoodDetailToJson(
        UserStorageFoodDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'user': instance.user,
      'food': instance.food,
    };
