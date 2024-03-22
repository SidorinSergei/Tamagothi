// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;

part 'app_api.swagger.chopper.dart';
part 'app_api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class AppApi extends ChopperService {
  static AppApi create({
    ChopperClient? client,
    Authenticator? authenticator,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$AppApi(client);
    }

    final newClient = ChopperClient(
        services: [_$AppApi()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://tamogochi.k-lab.su/'));
    return _$AppApi(newClient);
  }

  ///
  Future<chopper.Response<List<AdminDetail>>> adminsGet() {
    generatedMapping.putIfAbsent(
        AdminDetail, () => AdminDetail.fromJsonFactory);

    return _adminsGet();
  }

  ///
  @Get(path: '/admins/')
  Future<chopper.Response<List<AdminDetail>>> _adminsGet();

  ///
  ///@param data
  Future<chopper.Response<AdminDetail>> adminsPost(
      {required AdminDetail? data}) {
    generatedMapping.putIfAbsent(
        AdminDetail, () => AdminDetail.fromJsonFactory);

    return _adminsPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/admins/')
  Future<chopper.Response<AdminDetail>> _adminsPost(
      {@Body() required AdminDetail? data});

  ///
  Future<chopper.Response<AdminDetail>> adminsIdGet({required String? id}) {
    generatedMapping.putIfAbsent(
        AdminDetail, () => AdminDetail.fromJsonFactory);

    return _adminsIdGet(id: id);
  }

  ///
  @Get(path: '/admins/{id}/')
  Future<chopper.Response<AdminDetail>> _adminsIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<AdminDetail>> adminsIdPut({
    required AdminDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        AdminDetail, () => AdminDetail.fromJsonFactory);

    return _adminsIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/admins/{id}/')
  Future<chopper.Response<AdminDetail>> _adminsIdPut({
    @Body() required AdminDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<AdminDetail>> adminsIdPatch({
    required AdminDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        AdminDetail, () => AdminDetail.fromJsonFactory);

    return _adminsIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/admins/{id}/')
  Future<chopper.Response<AdminDetail>> _adminsIdPatch({
    @Body() required AdminDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> adminsIdDelete({required String? id}) {
    return _adminsIdDelete(id: id);
  }

  ///
  @Delete(path: '/admins/{id}/')
  Future<chopper.Response> _adminsIdDelete({@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<AuthenticationCodeSend>> authCodeSendPost(
      {required AuthenticationCodeSend? data}) {
    generatedMapping.putIfAbsent(
        AuthenticationCodeSend, () => AuthenticationCodeSend.fromJsonFactory);

    return _authCodeSendPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/auth_code/send/')
  Future<chopper.Response<AuthenticationCodeSend>> _authCodeSendPost(
      {@Body() required AuthenticationCodeSend? data});

  ///
  ///@param data
  Future<chopper.Response<AuthenticationCodeVerify>> authCodeVerifyPost(
      {required AuthenticationCodeVerify? data}) {
    generatedMapping.putIfAbsent(AuthenticationCodeVerify,
        () => AuthenticationCodeVerify.fromJsonFactory);

    return _authCodeVerifyPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/auth_code/verify/')
  Future<chopper.Response<AuthenticationCodeVerify>> _authCodeVerifyPost(
      {@Body() required AuthenticationCodeVerify? data});

  ///
  ///@param data
  Future<chopper.Response<BuyFood>> buyFoodPost({required BuyFood? data}) {
    generatedMapping.putIfAbsent(BuyFood, () => BuyFood.fromJsonFactory);

    return _buyFoodPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/buy/food/')
  Future<chopper.Response<BuyFood>> _buyFoodPost(
      {@Body() required BuyFood? data});

  ///
  ///@param data
  Future<chopper.Response<UserStorageSkinDetail>> buySkinPost(
      {required UserStorageSkinDetail? data}) {
    generatedMapping.putIfAbsent(
        UserStorageSkinDetail, () => UserStorageSkinDetail.fromJsonFactory);

    return _buySkinPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/buy/skin/')
  Future<chopper.Response<UserStorageSkinDetail>> _buySkinPost(
      {@Body() required UserStorageSkinDetail? data});

  ///
  Future<chopper.Response<List<CategoryDetail>>> categoriesGet() {
    generatedMapping.putIfAbsent(
        CategoryDetail, () => CategoryDetail.fromJsonFactory);

    return _categoriesGet();
  }

  ///
  @Get(path: '/categories/')
  Future<chopper.Response<List<CategoryDetail>>> _categoriesGet();

  ///
  ///@param data
  Future<chopper.Response<CategoryDetail>> categoriesPost(
      {required CategoryDetail? data}) {
    generatedMapping.putIfAbsent(
        CategoryDetail, () => CategoryDetail.fromJsonFactory);

    return _categoriesPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/categories/')
  Future<chopper.Response<CategoryDetail>> _categoriesPost(
      {@Body() required CategoryDetail? data});

  ///
  Future<chopper.Response<CategoryDetail>> categoriesIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(
        CategoryDetail, () => CategoryDetail.fromJsonFactory);

    return _categoriesIdGet(id: id);
  }

  ///
  @Get(path: '/categories/{id}/')
  Future<chopper.Response<CategoryDetail>> _categoriesIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<CategoryDetail>> categoriesIdPut({
    required CategoryDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        CategoryDetail, () => CategoryDetail.fromJsonFactory);

    return _categoriesIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/categories/{id}/')
  Future<chopper.Response<CategoryDetail>> _categoriesIdPut({
    @Body() required CategoryDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<CategoryDetail>> categoriesIdPatch({
    required CategoryDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        CategoryDetail, () => CategoryDetail.fromJsonFactory);

    return _categoriesIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/categories/{id}/')
  Future<chopper.Response<CategoryDetail>> _categoriesIdPatch({
    @Body() required CategoryDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> categoriesIdDelete({required String? id}) {
    return _categoriesIdDelete(id: id);
  }

  ///
  @Delete(path: '/categories/{id}/')
  Future<chopper.Response> _categoriesIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<List<CategoryFoodDetail>>> categoriesFoodGet() {
    generatedMapping.putIfAbsent(
        CategoryFoodDetail, () => CategoryFoodDetail.fromJsonFactory);

    return _categoriesFoodGet();
  }

  ///
  @Get(path: '/categories_food/')
  Future<chopper.Response<List<CategoryFoodDetail>>> _categoriesFoodGet();

  ///
  ///@param data
  Future<chopper.Response<CategoryFoodDetail>> categoriesFoodPost(
      {required CategoryFoodDetail? data}) {
    generatedMapping.putIfAbsent(
        CategoryFoodDetail, () => CategoryFoodDetail.fromJsonFactory);

    return _categoriesFoodPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/categories_food/')
  Future<chopper.Response<CategoryFoodDetail>> _categoriesFoodPost(
      {@Body() required CategoryFoodDetail? data});

  ///
  Future<chopper.Response<CategoryFoodDetail>> categoriesFoodCategoryGet(
      {required String? category}) {
    generatedMapping.putIfAbsent(
        CategoryFoodDetail, () => CategoryFoodDetail.fromJsonFactory);

    return _categoriesFoodCategoryGet(category: category);
  }

  ///
  @Get(path: '/categories_food/{category}/')
  Future<chopper.Response<CategoryFoodDetail>> _categoriesFoodCategoryGet(
      {@Path('category') required String? category});

  ///
  ///@param data
  Future<chopper.Response<CategoryFoodDetail>> categoriesFoodCategoryPut({
    required CategoryFoodDetail? data,
    required String? category,
  }) {
    generatedMapping.putIfAbsent(
        CategoryFoodDetail, () => CategoryFoodDetail.fromJsonFactory);

    return _categoriesFoodCategoryPut(data: data, category: category);
  }

  ///
  ///@param data
  @Put(path: '/categories_food/{category}/')
  Future<chopper.Response<CategoryFoodDetail>> _categoriesFoodCategoryPut({
    @Body() required CategoryFoodDetail? data,
    @Path('category') required String? category,
  });

  ///
  ///@param data
  Future<chopper.Response<CategoryFoodDetail>> categoriesFoodCategoryPatch({
    required CategoryFoodDetail? data,
    required String? category,
  }) {
    generatedMapping.putIfAbsent(
        CategoryFoodDetail, () => CategoryFoodDetail.fromJsonFactory);

    return _categoriesFoodCategoryPatch(data: data, category: category);
  }

  ///
  ///@param data
  @Patch(path: '/categories_food/{category}/')
  Future<chopper.Response<CategoryFoodDetail>> _categoriesFoodCategoryPatch({
    @Body() required CategoryFoodDetail? data,
    @Path('category') required String? category,
  });

  ///
  Future<chopper.Response> categoriesFoodCategoryDelete(
      {required String? category}) {
    return _categoriesFoodCategoryDelete(category: category);
  }

  ///
  @Delete(path: '/categories_food/{category}/')
  Future<chopper.Response> _categoriesFoodCategoryDelete(
      {@Path('category') required String? category});

  ///
  Future<chopper.Response<List<FoodDetail>>> foodGet() {
    generatedMapping.putIfAbsent(FoodDetail, () => FoodDetail.fromJsonFactory);

    return _foodGet();
  }

  ///
  @Get(path: '/food/')
  Future<chopper.Response<List<FoodDetail>>> _foodGet();

  ///
  ///@param data
  Future<chopper.Response<FoodDetail>> foodPost({required FoodDetail? data}) {
    generatedMapping.putIfAbsent(FoodDetail, () => FoodDetail.fromJsonFactory);

    return _foodPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/food/')
  Future<chopper.Response<FoodDetail>> _foodPost(
      {@Body() required FoodDetail? data});

  ///
  Future<chopper.Response<FoodDetail>> foodIdGet({required String? id}) {
    generatedMapping.putIfAbsent(FoodDetail, () => FoodDetail.fromJsonFactory);

    return _foodIdGet(id: id);
  }

  ///
  @Get(path: '/food/{id}/')
  Future<chopper.Response<FoodDetail>> _foodIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<FoodDetail>> foodIdPut({
    required FoodDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(FoodDetail, () => FoodDetail.fromJsonFactory);

    return _foodIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/food/{id}/')
  Future<chopper.Response<FoodDetail>> _foodIdPut({
    @Body() required FoodDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<FoodDetail>> foodIdPatch({
    required FoodDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(FoodDetail, () => FoodDetail.fromJsonFactory);

    return _foodIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/food/{id}/')
  Future<chopper.Response<FoodDetail>> _foodIdPatch({
    @Body() required FoodDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> foodIdDelete({required String? id}) {
    return _foodIdDelete(id: id);
  }

  ///
  @Delete(path: '/food/{id}/')
  Future<chopper.Response> _foodIdDelete({@Path('id') required String? id});

  ///
  Future<chopper.Response<List<GameDetail>>> gamesGet() {
    generatedMapping.putIfAbsent(GameDetail, () => GameDetail.fromJsonFactory);

    return _gamesGet();
  }

  ///
  @Get(path: '/games/')
  Future<chopper.Response<List<GameDetail>>> _gamesGet();

  ///
  ///@param data
  Future<chopper.Response<GameDetail>> gamesPost({required GameDetail? data}) {
    generatedMapping.putIfAbsent(GameDetail, () => GameDetail.fromJsonFactory);

    return _gamesPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/games/')
  Future<chopper.Response<GameDetail>> _gamesPost(
      {@Body() required GameDetail? data});

  ///
  Future<chopper.Response<GameDetail>> gamesIdGet({required String? id}) {
    generatedMapping.putIfAbsent(GameDetail, () => GameDetail.fromJsonFactory);

    return _gamesIdGet(id: id);
  }

  ///
  @Get(path: '/games/{id}/')
  Future<chopper.Response<GameDetail>> _gamesIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<GameDetail>> gamesIdPut({
    required GameDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(GameDetail, () => GameDetail.fromJsonFactory);

    return _gamesIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/games/{id}/')
  Future<chopper.Response<GameDetail>> _gamesIdPut({
    @Body() required GameDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<GameDetail>> gamesIdPatch({
    required GameDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(GameDetail, () => GameDetail.fromJsonFactory);

    return _gamesIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/games/{id}/')
  Future<chopper.Response<GameDetail>> _gamesIdPatch({
    @Body() required GameDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> gamesIdDelete({required String? id}) {
    return _gamesIdDelete(id: id);
  }

  ///
  @Delete(path: '/games/{id}/')
  Future<chopper.Response> _gamesIdDelete({@Path('id') required String? id});

  ///
  Future<chopper.Response<List<PersonalityDetail>>> personalityGet() {
    generatedMapping.putIfAbsent(
        PersonalityDetail, () => PersonalityDetail.fromJsonFactory);

    return _personalityGet();
  }

  ///
  @Get(path: '/personality/')
  Future<chopper.Response<List<PersonalityDetail>>> _personalityGet();

  ///
  ///@param data
  Future<chopper.Response<PersonalityDetail>> personalityPost(
      {required PersonalityDetail? data}) {
    generatedMapping.putIfAbsent(
        PersonalityDetail, () => PersonalityDetail.fromJsonFactory);

    return _personalityPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/personality/')
  Future<chopper.Response<PersonalityDetail>> _personalityPost(
      {@Body() required PersonalityDetail? data});

  ///
  Future<chopper.Response<PersonalityDetail>> personalityIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(
        PersonalityDetail, () => PersonalityDetail.fromJsonFactory);

    return _personalityIdGet(id: id);
  }

  ///
  @Get(path: '/personality/{id}/')
  Future<chopper.Response<PersonalityDetail>> _personalityIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<PersonalityDetail>> personalityIdPut({
    required PersonalityDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        PersonalityDetail, () => PersonalityDetail.fromJsonFactory);

    return _personalityIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/personality/{id}/')
  Future<chopper.Response<PersonalityDetail>> _personalityIdPut({
    @Body() required PersonalityDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<PersonalityDetail>> personalityIdPatch({
    required PersonalityDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        PersonalityDetail, () => PersonalityDetail.fromJsonFactory);

    return _personalityIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/personality/{id}/')
  Future<chopper.Response<PersonalityDetail>> _personalityIdPatch({
    @Body() required PersonalityDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> personalityIdDelete({required String? id}) {
    return _personalityIdDelete(id: id);
  }

  ///
  @Delete(path: '/personality/{id}/')
  Future<chopper.Response> _personalityIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<List<PetDetail>>> petsGet() {
    generatedMapping.putIfAbsent(PetDetail, () => PetDetail.fromJsonFactory);

    return _petsGet();
  }

  ///
  @Get(path: '/pets/')
  Future<chopper.Response<List<PetDetail>>> _petsGet();

  ///
  ///@param data
  Future<chopper.Response<PetDetail>> petsPost({required PetDetail? data}) {
    generatedMapping.putIfAbsent(PetDetail, () => PetDetail.fromJsonFactory);

    return _petsPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/pets/')
  Future<chopper.Response<PetDetail>> _petsPost(
      {@Body() required PetDetail? data});

  ///
  ///@param data
  Future<chopper.Response<PetPointsIncrease>> petsIncreasePost(
      {required PetPointsIncrease? data}) {
    generatedMapping.putIfAbsent(
        PetPointsIncrease, () => PetPointsIncrease.fromJsonFactory);

    return _petsIncreasePost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/pets/increase/')
  Future<chopper.Response<PetPointsIncrease>> _petsIncreasePost(
      {@Body() required PetPointsIncrease? data});

  ///
  Future<chopper.Response<PetDetail>> petsIdGet({required String? id}) {
    generatedMapping.putIfAbsent(PetDetail, () => PetDetail.fromJsonFactory);

    return _petsIdGet(id: id);
  }

  ///
  @Get(path: '/pets/{id}/')
  Future<chopper.Response<PetDetail>> _petsIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<PetDetail>> petsIdPut({
    required PetDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(PetDetail, () => PetDetail.fromJsonFactory);

    return _petsIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/pets/{id}/')
  Future<chopper.Response<PetDetail>> _petsIdPut({
    @Body() required PetDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<PetDetail>> petsIdPatch({
    required PetDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(PetDetail, () => PetDetail.fromJsonFactory);

    return _petsIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/pets/{id}/')
  Future<chopper.Response<PetDetail>> _petsIdPatch({
    @Body() required PetDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> petsIdDelete({required String? id}) {
    return _petsIdDelete(id: id);
  }

  ///
  @Delete(path: '/pets/{id}/')
  Future<chopper.Response> _petsIdDelete({@Path('id') required String? id});

  ///
  Future<chopper.Response<PetPoints>> petsIdPointsGet({required int? id}) {
    generatedMapping.putIfAbsent(PetPoints, () => PetPoints.fromJsonFactory);

    return _petsIdPointsGet(id: id);
  }

  ///
  @Get(path: '/pets/{id}/points/')
  Future<chopper.Response<PetPoints>> _petsIdPointsGet(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<SkinDetail>>> skinGet() {
    generatedMapping.putIfAbsent(SkinDetail, () => SkinDetail.fromJsonFactory);

    return _skinGet();
  }

  ///
  @Get(path: '/skin/')
  Future<chopper.Response<List<SkinDetail>>> _skinGet();

  ///
  ///@param data
  Future<chopper.Response<SkinDetail>> skinPost({required SkinDetail? data}) {
    generatedMapping.putIfAbsent(SkinDetail, () => SkinDetail.fromJsonFactory);

    return _skinPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/skin/')
  Future<chopper.Response<SkinDetail>> _skinPost(
      {@Body() required SkinDetail? data});

  ///
  Future<chopper.Response<SkinDetail>> skinIdGet({required String? id}) {
    generatedMapping.putIfAbsent(SkinDetail, () => SkinDetail.fromJsonFactory);

    return _skinIdGet(id: id);
  }

  ///
  @Get(path: '/skin/{id}/')
  Future<chopper.Response<SkinDetail>> _skinIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<SkinDetail>> skinIdPut({
    required SkinDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(SkinDetail, () => SkinDetail.fromJsonFactory);

    return _skinIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/skin/{id}/')
  Future<chopper.Response<SkinDetail>> _skinIdPut({
    @Body() required SkinDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<SkinDetail>> skinIdPatch({
    required SkinDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(SkinDetail, () => SkinDetail.fromJsonFactory);

    return _skinIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/skin/{id}/')
  Future<chopper.Response<SkinDetail>> _skinIdPatch({
    @Body() required SkinDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> skinIdDelete({required String? id}) {
    return _skinIdDelete(id: id);
  }

  ///
  @Delete(path: '/skin/{id}/')
  Future<chopper.Response> _skinIdDelete({@Path('id') required String? id});

  ///
  Future<chopper.Response<List<UserDetail>>> userProfilesGet() {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _userProfilesGet();
  }

  ///
  @Get(path: '/user_profiles/')
  Future<chopper.Response<List<UserDetail>>> _userProfilesGet();

  ///
  ///@param data
  Future<chopper.Response<UserDetail>> userProfilesPost(
      {required UserDetail? data}) {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _userProfilesPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/user_profiles/')
  Future<chopper.Response<UserDetail>> _userProfilesPost(
      {@Body() required UserDetail? data});

  ///
  ///@param data
  Future<chopper.Response<UserEditBalance>> userProfilesEditBalancePost(
      {required UserEditBalance? data}) {
    generatedMapping.putIfAbsent(
        UserEditBalance, () => UserEditBalance.fromJsonFactory);

    return _userProfilesEditBalancePost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/user_profiles/edit_balance/')
  Future<chopper.Response<UserEditBalance>> _userProfilesEditBalancePost(
      {@Body() required UserEditBalance? data});

  ///
  ///@param data
  Future<chopper.Response<UserSetNick>> userProfilesSetNamePost(
      {required UserSetNick? data}) {
    generatedMapping.putIfAbsent(
        UserSetNick, () => UserSetNick.fromJsonFactory);

    return _userProfilesSetNamePost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/user_profiles/set_name/')
  Future<chopper.Response<UserSetNick>> _userProfilesSetNamePost(
      {@Body() required UserSetNick? data});

  ///
  Future<chopper.Response<UserDetail>> userProfilesIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _userProfilesIdGet(id: id);
  }

  ///
  @Get(path: '/user_profiles/{id}/')
  Future<chopper.Response<UserDetail>> _userProfilesIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<UserDetail>> userProfilesIdPut({
    required UserDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _userProfilesIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/user_profiles/{id}/')
  Future<chopper.Response<UserDetail>> _userProfilesIdPut({
    @Body() required UserDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<UserDetail>> userProfilesIdPatch({
    required UserDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(UserDetail, () => UserDetail.fromJsonFactory);

    return _userProfilesIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/user_profiles/{id}/')
  Future<chopper.Response<UserDetail>> _userProfilesIdPatch({
    @Body() required UserDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> userProfilesIdDelete({required String? id}) {
    return _userProfilesIdDelete(id: id);
  }

  ///
  @Delete(path: '/user_profiles/{id}/')
  Future<chopper.Response> _userProfilesIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<List<UserStorageFoodDetail>>> userStorageFoodGet() {
    generatedMapping.putIfAbsent(
        UserStorageFoodDetail, () => UserStorageFoodDetail.fromJsonFactory);

    return _userStorageFoodGet();
  }

  ///
  @Get(path: '/user_storage_food/')
  Future<chopper.Response<List<UserStorageFoodDetail>>> _userStorageFoodGet();

  ///
  ///@param data
  Future<chopper.Response<UserStorageFoodDetail>> userStorageFoodPost(
      {required UserStorageFoodDetail? data}) {
    generatedMapping.putIfAbsent(
        UserStorageFoodDetail, () => UserStorageFoodDetail.fromJsonFactory);

    return _userStorageFoodPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/user_storage_food/')
  Future<chopper.Response<UserStorageFoodDetail>> _userStorageFoodPost(
      {@Body() required UserStorageFoodDetail? data});

  ///
  Future<chopper.Response<UserStorageFoodDetail>> userStorageFoodIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(
        UserStorageFoodDetail, () => UserStorageFoodDetail.fromJsonFactory);

    return _userStorageFoodIdGet(id: id);
  }

  ///
  @Get(path: '/user_storage_food/{id}/')
  Future<chopper.Response<UserStorageFoodDetail>> _userStorageFoodIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<UserStorageFoodDetail>> userStorageFoodIdPut({
    required UserStorageFoodDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        UserStorageFoodDetail, () => UserStorageFoodDetail.fromJsonFactory);

    return _userStorageFoodIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/user_storage_food/{id}/')
  Future<chopper.Response<UserStorageFoodDetail>> _userStorageFoodIdPut({
    @Body() required UserStorageFoodDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<UserStorageFoodDetail>> userStorageFoodIdPatch({
    required UserStorageFoodDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        UserStorageFoodDetail, () => UserStorageFoodDetail.fromJsonFactory);

    return _userStorageFoodIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/user_storage_food/{id}/')
  Future<chopper.Response<UserStorageFoodDetail>> _userStorageFoodIdPatch({
    @Body() required UserStorageFoodDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> userStorageFoodIdDelete({required String? id}) {
    return _userStorageFoodIdDelete(id: id);
  }

  ///
  @Delete(path: '/user_storage_food/{id}/')
  Future<chopper.Response> _userStorageFoodIdDelete(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<List<UserStorageSkinDetail>>> userStorageSkinGet() {
    generatedMapping.putIfAbsent(
        UserStorageSkinDetail, () => UserStorageSkinDetail.fromJsonFactory);

    return _userStorageSkinGet();
  }

  ///
  @Get(path: '/user_storage_skin/')
  Future<chopper.Response<List<UserStorageSkinDetail>>> _userStorageSkinGet();

  ///
  ///@param data
  Future<chopper.Response<UserStorageSkinDetail>> userStorageSkinPost(
      {required UserStorageSkinDetail? data}) {
    generatedMapping.putIfAbsent(
        UserStorageSkinDetail, () => UserStorageSkinDetail.fromJsonFactory);

    return _userStorageSkinPost(data: data);
  }

  ///
  ///@param data
  @Post(path: '/user_storage_skin/')
  Future<chopper.Response<UserStorageSkinDetail>> _userStorageSkinPost(
      {@Body() required UserStorageSkinDetail? data});

  ///
  Future<chopper.Response<UserStorageSkinDetail>> userStorageSkinIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(
        UserStorageSkinDetail, () => UserStorageSkinDetail.fromJsonFactory);

    return _userStorageSkinIdGet(id: id);
  }

  ///
  @Get(path: '/user_storage_skin/{id}/')
  Future<chopper.Response<UserStorageSkinDetail>> _userStorageSkinIdGet(
      {@Path('id') required String? id});

  ///
  ///@param data
  Future<chopper.Response<UserStorageSkinDetail>> userStorageSkinIdPut({
    required UserStorageSkinDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        UserStorageSkinDetail, () => UserStorageSkinDetail.fromJsonFactory);

    return _userStorageSkinIdPut(data: data, id: id);
  }

  ///
  ///@param data
  @Put(path: '/user_storage_skin/{id}/')
  Future<chopper.Response<UserStorageSkinDetail>> _userStorageSkinIdPut({
    @Body() required UserStorageSkinDetail? data,
    @Path('id') required String? id,
  });

  ///
  ///@param data
  Future<chopper.Response<UserStorageSkinDetail>> userStorageSkinIdPatch({
    required UserStorageSkinDetail? data,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        UserStorageSkinDetail, () => UserStorageSkinDetail.fromJsonFactory);

    return _userStorageSkinIdPatch(data: data, id: id);
  }

  ///
  ///@param data
  @Patch(path: '/user_storage_skin/{id}/')
  Future<chopper.Response<UserStorageSkinDetail>> _userStorageSkinIdPatch({
    @Body() required UserStorageSkinDetail? data,
    @Path('id') required String? id,
  });

  ///
  Future<chopper.Response> userStorageSkinIdDelete({required String? id}) {
    return _userStorageSkinIdDelete(id: id);
  }

  ///
  @Delete(path: '/user_storage_skin/{id}/')
  Future<chopper.Response> _userStorageSkinIdDelete(
      {@Path('id') required String? id});
}

@JsonSerializable(explicitToJson: true)
class AdminDetail {
  AdminDetail({
    this.id,
    required this.login,
    required this.password,
  });

  factory AdminDetail.fromJson(Map<String, dynamic> json) =>
      _$AdminDetailFromJson(json);

  static const toJsonFactory = _$AdminDetailToJson;
  Map<String, dynamic> toJson() => _$AdminDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'login')
  final String login;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$AdminDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AdminDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.login, login) ||
                const DeepCollectionEquality().equals(other.login, login)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(login) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $AdminDetailExtension on AdminDetail {
  AdminDetail copyWith({int? id, String? login, String? password}) {
    return AdminDetail(
        id: id ?? this.id,
        login: login ?? this.login,
        password: password ?? this.password);
  }

  AdminDetail copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String>? login, Wrapped<String>? password}) {
    return AdminDetail(
        id: (id != null ? id.value : this.id),
        login: (login != null ? login.value : this.login),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationCodeSend {
  AuthenticationCodeSend({
    required this.phoneNumber,
  });

  factory AuthenticationCodeSend.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationCodeSendFromJson(json);

  static const toJsonFactory = _$AuthenticationCodeSendToJson;
  Map<String, dynamic> toJson() => _$AuthenticationCodeSendToJson(this);

  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  static const fromJsonFactory = _$AuthenticationCodeSendFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationCodeSend &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phoneNumber) ^ runtimeType.hashCode;
}

extension $AuthenticationCodeSendExtension on AuthenticationCodeSend {
  AuthenticationCodeSend copyWith({String? phoneNumber}) {
    return AuthenticationCodeSend(phoneNumber: phoneNumber ?? this.phoneNumber);
  }

  AuthenticationCodeSend copyWithWrapped({Wrapped<String>? phoneNumber}) {
    return AuthenticationCodeSend(
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthenticationCodeVerify {
  AuthenticationCodeVerify({
    required this.phoneNumber,
    required this.code,
  });

  factory AuthenticationCodeVerify.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationCodeVerifyFromJson(json);

  static const toJsonFactory = _$AuthenticationCodeVerifyToJson;
  Map<String, dynamic> toJson() => _$AuthenticationCodeVerifyToJson(this);

  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'code')
  final String code;
  static const fromJsonFactory = _$AuthenticationCodeVerifyFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationCodeVerify &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(code) ^
      runtimeType.hashCode;
}

extension $AuthenticationCodeVerifyExtension on AuthenticationCodeVerify {
  AuthenticationCodeVerify copyWith({String? phoneNumber, String? code}) {
    return AuthenticationCodeVerify(
        phoneNumber: phoneNumber ?? this.phoneNumber, code: code ?? this.code);
  }

  AuthenticationCodeVerify copyWithWrapped(
      {Wrapped<String>? phoneNumber, Wrapped<String>? code}) {
    return AuthenticationCodeVerify(
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        code: (code != null ? code.value : this.code));
  }
}

@JsonSerializable(explicitToJson: true)
class BuyFood {
  BuyFood({
    this.user,
    this.food,
  });

  factory BuyFood.fromJson(Map<String, dynamic> json) =>
      _$BuyFoodFromJson(json);

  static const toJsonFactory = _$BuyFoodToJson;
  Map<String, dynamic> toJson() => _$BuyFoodToJson(this);

  @JsonKey(name: 'user')
  final int? user;
  @JsonKey(name: 'food')
  final int? food;
  static const fromJsonFactory = _$BuyFoodFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BuyFood &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.food, food) ||
                const DeepCollectionEquality().equals(other.food, food)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(food) ^
      runtimeType.hashCode;
}

extension $BuyFoodExtension on BuyFood {
  BuyFood copyWith({int? user, int? food}) {
    return BuyFood(user: user ?? this.user, food: food ?? this.food);
  }

  BuyFood copyWithWrapped({Wrapped<int?>? user, Wrapped<int?>? food}) {
    return BuyFood(
        user: (user != null ? user.value : this.user),
        food: (food != null ? food.value : this.food));
  }
}

@JsonSerializable(explicitToJson: true)
class UserStorageSkinDetail {
  UserStorageSkinDetail({
    this.id,
    required this.user,
    required this.skin,
  });

  factory UserStorageSkinDetail.fromJson(Map<String, dynamic> json) =>
      _$UserStorageSkinDetailFromJson(json);

  static const toJsonFactory = _$UserStorageSkinDetailToJson;
  Map<String, dynamic> toJson() => _$UserStorageSkinDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'skin')
  final int skin;
  static const fromJsonFactory = _$UserStorageSkinDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserStorageSkinDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.skin, skin) ||
                const DeepCollectionEquality().equals(other.skin, skin)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(skin) ^
      runtimeType.hashCode;
}

extension $UserStorageSkinDetailExtension on UserStorageSkinDetail {
  UserStorageSkinDetail copyWith({int? id, int? user, int? skin}) {
    return UserStorageSkinDetail(
        id: id ?? this.id, user: user ?? this.user, skin: skin ?? this.skin);
  }

  UserStorageSkinDetail copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<int>? user, Wrapped<int>? skin}) {
    return UserStorageSkinDetail(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        skin: (skin != null ? skin.value : this.skin));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDetail {
  CategoryDetail({
    this.id,
    required this.categoryName,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailFromJson(json);

  static const toJsonFactory = _$CategoryDetailToJson;
  Map<String, dynamic> toJson() => _$CategoryDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'category_name')
  final String categoryName;
  static const fromJsonFactory = _$CategoryDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(categoryName) ^
      runtimeType.hashCode;
}

extension $CategoryDetailExtension on CategoryDetail {
  CategoryDetail copyWith({int? id, String? categoryName}) {
    return CategoryDetail(
        id: id ?? this.id, categoryName: categoryName ?? this.categoryName);
  }

  CategoryDetail copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<String>? categoryName}) {
    return CategoryDetail(
        id: (id != null ? id.value : this.id),
        categoryName:
            (categoryName != null ? categoryName.value : this.categoryName));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryFoodDetail {
  CategoryFoodDetail({
    required this.category,
    required this.food,
  });

  factory CategoryFoodDetail.fromJson(Map<String, dynamic> json) =>
      _$CategoryFoodDetailFromJson(json);

  static const toJsonFactory = _$CategoryFoodDetailToJson;
  Map<String, dynamic> toJson() => _$CategoryFoodDetailToJson(this);

  @JsonKey(name: 'category')
  final int category;
  @JsonKey(name: 'food')
  final int food;
  static const fromJsonFactory = _$CategoryFoodDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryFoodDetail &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.food, food) ||
                const DeepCollectionEquality().equals(other.food, food)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(food) ^
      runtimeType.hashCode;
}

extension $CategoryFoodDetailExtension on CategoryFoodDetail {
  CategoryFoodDetail copyWith({int? category, int? food}) {
    return CategoryFoodDetail(
        category: category ?? this.category, food: food ?? this.food);
  }

  CategoryFoodDetail copyWithWrapped(
      {Wrapped<int>? category, Wrapped<int>? food}) {
    return CategoryFoodDetail(
        category: (category != null ? category.value : this.category),
        food: (food != null ? food.value : this.food));
  }
}

@JsonSerializable(explicitToJson: true)
class FoodDetail {
  FoodDetail({
    this.id,
    required this.name,
    required this.price,
    required this.saturation,
  });

  factory FoodDetail.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailFromJson(json);

  static const toJsonFactory = _$FoodDetailToJson;
  Map<String, dynamic> toJson() => _$FoodDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'saturation')
  final int saturation;
  static const fromJsonFactory = _$FoodDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FoodDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.saturation, saturation) ||
                const DeepCollectionEquality()
                    .equals(other.saturation, saturation)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(saturation) ^
      runtimeType.hashCode;
}

extension $FoodDetailExtension on FoodDetail {
  FoodDetail copyWith({int? id, String? name, int? price, int? saturation}) {
    return FoodDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        saturation: saturation ?? this.saturation);
  }

  FoodDetail copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String>? name,
      Wrapped<int>? price,
      Wrapped<int>? saturation}) {
    return FoodDetail(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        price: (price != null ? price.value : this.price),
        saturation: (saturation != null ? saturation.value : this.saturation));
  }
}

@JsonSerializable(explicitToJson: true)
class GameDetail {
  GameDetail({
    this.id,
    required this.points,
    this.user,
  });

  factory GameDetail.fromJson(Map<String, dynamic> json) =>
      _$GameDetailFromJson(json);

  static const toJsonFactory = _$GameDetailToJson;
  Map<String, dynamic> toJson() => _$GameDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'points')
  final int points;
  @JsonKey(name: 'user')
  final int? user;
  static const fromJsonFactory = _$GameDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(points) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $GameDetailExtension on GameDetail {
  GameDetail copyWith({int? id, int? points, int? user}) {
    return GameDetail(
        id: id ?? this.id,
        points: points ?? this.points,
        user: user ?? this.user);
  }

  GameDetail copyWithWrapped(
      {Wrapped<int?>? id, Wrapped<int>? points, Wrapped<int?>? user}) {
    return GameDetail(
        id: (id != null ? id.value : this.id),
        points: (points != null ? points.value : this.points),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class PersonalityDetail {
  PersonalityDetail({
    this.id,
    required this.personality,
    this.category,
  });

  factory PersonalityDetail.fromJson(Map<String, dynamic> json) =>
      _$PersonalityDetailFromJson(json);

  static const toJsonFactory = _$PersonalityDetailToJson;
  Map<String, dynamic> toJson() => _$PersonalityDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'personality')
  final String personality;
  @JsonKey(name: 'category')
  final int? category;
  static const fromJsonFactory = _$PersonalityDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PersonalityDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.personality, personality) ||
                const DeepCollectionEquality()
                    .equals(other.personality, personality)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(personality) ^
      const DeepCollectionEquality().hash(category) ^
      runtimeType.hashCode;
}

extension $PersonalityDetailExtension on PersonalityDetail {
  PersonalityDetail copyWith({int? id, String? personality, int? category}) {
    return PersonalityDetail(
        id: id ?? this.id,
        personality: personality ?? this.personality,
        category: category ?? this.category);
  }

  PersonalityDetail copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String>? personality,
      Wrapped<int?>? category}) {
    return PersonalityDetail(
        id: (id != null ? id.value : this.id),
        personality:
            (personality != null ? personality.value : this.personality),
        category: (category != null ? category.value : this.category));
  }
}

@JsonSerializable(explicitToJson: true)
class PetDetail {
  PetDetail({
    this.id,
    required this.name,
    this.age,
    this.isMale,
    this.moodPoints,
    this.purityPoints,
    this.starvationPoints,
    required this.user,
    this.personality,
  });

  factory PetDetail.fromJson(Map<String, dynamic> json) =>
      _$PetDetailFromJson(json);

  static const toJsonFactory = _$PetDetailToJson;
  Map<String, dynamic> toJson() => _$PetDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'age')
  final int? age;
  @JsonKey(name: 'is_male')
  final bool? isMale;
  @JsonKey(name: 'mood_points')
  final int? moodPoints;
  @JsonKey(name: 'purity_points')
  final int? purityPoints;
  @JsonKey(name: 'starvation_points')
  final int? starvationPoints;
  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'personality')
  final int? personality;
  static const fromJsonFactory = _$PetDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PetDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.isMale, isMale) ||
                const DeepCollectionEquality().equals(other.isMale, isMale)) &&
            (identical(other.moodPoints, moodPoints) ||
                const DeepCollectionEquality()
                    .equals(other.moodPoints, moodPoints)) &&
            (identical(other.purityPoints, purityPoints) ||
                const DeepCollectionEquality()
                    .equals(other.purityPoints, purityPoints)) &&
            (identical(other.starvationPoints, starvationPoints) ||
                const DeepCollectionEquality()
                    .equals(other.starvationPoints, starvationPoints)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.personality, personality) ||
                const DeepCollectionEquality()
                    .equals(other.personality, personality)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(isMale) ^
      const DeepCollectionEquality().hash(moodPoints) ^
      const DeepCollectionEquality().hash(purityPoints) ^
      const DeepCollectionEquality().hash(starvationPoints) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(personality) ^
      runtimeType.hashCode;
}

extension $PetDetailExtension on PetDetail {
  PetDetail copyWith(
      {int? id,
      String? name,
      int? age,
      bool? isMale,
      int? moodPoints,
      int? purityPoints,
      int? starvationPoints,
      int? user,
      int? personality}) {
    return PetDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        isMale: isMale ?? this.isMale,
        moodPoints: moodPoints ?? this.moodPoints,
        purityPoints: purityPoints ?? this.purityPoints,
        starvationPoints: starvationPoints ?? this.starvationPoints,
        user: user ?? this.user,
        personality: personality ?? this.personality);
  }

  PetDetail copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String>? name,
      Wrapped<int?>? age,
      Wrapped<bool?>? isMale,
      Wrapped<int?>? moodPoints,
      Wrapped<int?>? purityPoints,
      Wrapped<int?>? starvationPoints,
      Wrapped<int>? user,
      Wrapped<int?>? personality}) {
    return PetDetail(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        age: (age != null ? age.value : this.age),
        isMale: (isMale != null ? isMale.value : this.isMale),
        moodPoints: (moodPoints != null ? moodPoints.value : this.moodPoints),
        purityPoints:
            (purityPoints != null ? purityPoints.value : this.purityPoints),
        starvationPoints: (starvationPoints != null
            ? starvationPoints.value
            : this.starvationPoints),
        user: (user != null ? user.value : this.user),
        personality:
            (personality != null ? personality.value : this.personality));
  }
}

@JsonSerializable(explicitToJson: true)
class PetPointsIncrease {
  PetPointsIncrease({
    required this.petId,
    required this.characteristic,
    required this.value,
  });

  factory PetPointsIncrease.fromJson(Map<String, dynamic> json) =>
      _$PetPointsIncreaseFromJson(json);

  static const toJsonFactory = _$PetPointsIncreaseToJson;
  Map<String, dynamic> toJson() => _$PetPointsIncreaseToJson(this);

  @JsonKey(name: 'pet_id')
  final int petId;
  @JsonKey(name: 'characteristic')
  final String characteristic;
  @JsonKey(name: 'value')
  final int value;
  static const fromJsonFactory = _$PetPointsIncreaseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PetPointsIncrease &&
            (identical(other.petId, petId) ||
                const DeepCollectionEquality().equals(other.petId, petId)) &&
            (identical(other.characteristic, characteristic) ||
                const DeepCollectionEquality()
                    .equals(other.characteristic, characteristic)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(petId) ^
      const DeepCollectionEquality().hash(characteristic) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $PetPointsIncreaseExtension on PetPointsIncrease {
  PetPointsIncrease copyWith({int? petId, String? characteristic, int? value}) {
    return PetPointsIncrease(
        petId: petId ?? this.petId,
        characteristic: characteristic ?? this.characteristic,
        value: value ?? this.value);
  }

  PetPointsIncrease copyWithWrapped(
      {Wrapped<int>? petId,
      Wrapped<String>? characteristic,
      Wrapped<int>? value}) {
    return PetPointsIncrease(
        petId: (petId != null ? petId.value : this.petId),
        characteristic: (characteristic != null
            ? characteristic.value
            : this.characteristic),
        value: (value != null ? value.value : this.value));
  }
}

@JsonSerializable(explicitToJson: true)
class PetPoints {
  PetPoints({
    this.moodPoints,
    this.purityPoints,
    this.starvationPoints,
  });

  factory PetPoints.fromJson(Map<String, dynamic> json) =>
      _$PetPointsFromJson(json);

  static const toJsonFactory = _$PetPointsToJson;
  Map<String, dynamic> toJson() => _$PetPointsToJson(this);

  @JsonKey(name: 'mood_points')
  final int? moodPoints;
  @JsonKey(name: 'purity_points')
  final int? purityPoints;
  @JsonKey(name: 'starvation_points')
  final int? starvationPoints;
  static const fromJsonFactory = _$PetPointsFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PetPoints &&
            (identical(other.moodPoints, moodPoints) ||
                const DeepCollectionEquality()
                    .equals(other.moodPoints, moodPoints)) &&
            (identical(other.purityPoints, purityPoints) ||
                const DeepCollectionEquality()
                    .equals(other.purityPoints, purityPoints)) &&
            (identical(other.starvationPoints, starvationPoints) ||
                const DeepCollectionEquality()
                    .equals(other.starvationPoints, starvationPoints)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(moodPoints) ^
      const DeepCollectionEquality().hash(purityPoints) ^
      const DeepCollectionEquality().hash(starvationPoints) ^
      runtimeType.hashCode;
}

extension $PetPointsExtension on PetPoints {
  PetPoints copyWith(
      {int? moodPoints, int? purityPoints, int? starvationPoints}) {
    return PetPoints(
        moodPoints: moodPoints ?? this.moodPoints,
        purityPoints: purityPoints ?? this.purityPoints,
        starvationPoints: starvationPoints ?? this.starvationPoints);
  }

  PetPoints copyWithWrapped(
      {Wrapped<int?>? moodPoints,
      Wrapped<int?>? purityPoints,
      Wrapped<int?>? starvationPoints}) {
    return PetPoints(
        moodPoints: (moodPoints != null ? moodPoints.value : this.moodPoints),
        purityPoints:
            (purityPoints != null ? purityPoints.value : this.purityPoints),
        starvationPoints: (starvationPoints != null
            ? starvationPoints.value
            : this.starvationPoints));
  }
}

@JsonSerializable(explicitToJson: true)
class SkinDetail {
  SkinDetail({
    this.id,
    required this.type,
    this.description,
    this.price,
  });

  factory SkinDetail.fromJson(Map<String, dynamic> json) =>
      _$SkinDetailFromJson(json);

  static const toJsonFactory = _$SkinDetailToJson;
  Map<String, dynamic> toJson() => _$SkinDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'price')
  final int? price;
  static const fromJsonFactory = _$SkinDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SkinDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(price) ^
      runtimeType.hashCode;
}

extension $SkinDetailExtension on SkinDetail {
  SkinDetail copyWith(
      {int? id, String? type, String? description, int? price}) {
    return SkinDetail(
        id: id ?? this.id,
        type: type ?? this.type,
        description: description ?? this.description,
        price: price ?? this.price);
  }

  SkinDetail copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String>? type,
      Wrapped<String?>? description,
      Wrapped<int?>? price}) {
    return SkinDetail(
        id: (id != null ? id.value : this.id),
        type: (type != null ? type.value : this.type),
        description:
            (description != null ? description.value : this.description),
        price: (price != null ? price.value : this.price));
  }
}

@JsonSerializable(explicitToJson: true)
class UserDetail {
  UserDetail({
    this.id,
    this.name,
    required this.phoneNumber,
    this.createdAt,
    this.balance,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  static const toJsonFactory = _$UserDetailToJson;
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'balance')
  final int? balance;
  static const fromJsonFactory = _$UserDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(balance) ^
      runtimeType.hashCode;
}

extension $UserDetailExtension on UserDetail {
  UserDetail copyWith(
      {int? id,
      String? name,
      String? phoneNumber,
      DateTime? createdAt,
      int? balance}) {
    return UserDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        createdAt: createdAt ?? this.createdAt,
        balance: balance ?? this.balance);
  }

  UserDetail copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? name,
      Wrapped<String>? phoneNumber,
      Wrapped<DateTime?>? createdAt,
      Wrapped<int?>? balance}) {
    return UserDetail(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        balance: (balance != null ? balance.value : this.balance));
  }
}

@JsonSerializable(explicitToJson: true)
class UserEditBalance {
  UserEditBalance({
    required this.id,
    this.balance,
  });

  factory UserEditBalance.fromJson(Map<String, dynamic> json) =>
      _$UserEditBalanceFromJson(json);

  static const toJsonFactory = _$UserEditBalanceToJson;
  Map<String, dynamic> toJson() => _$UserEditBalanceToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'balance')
  final int? balance;
  static const fromJsonFactory = _$UserEditBalanceFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserEditBalance &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(balance) ^
      runtimeType.hashCode;
}

extension $UserEditBalanceExtension on UserEditBalance {
  UserEditBalance copyWith({int? id, int? balance}) {
    return UserEditBalance(id: id ?? this.id, balance: balance ?? this.balance);
  }

  UserEditBalance copyWithWrapped({Wrapped<int>? id, Wrapped<int?>? balance}) {
    return UserEditBalance(
        id: (id != null ? id.value : this.id),
        balance: (balance != null ? balance.value : this.balance));
  }
}

@JsonSerializable(explicitToJson: true)
class UserSetNick {
  UserSetNick({
    required this.id,
    this.name,
  });

  factory UserSetNick.fromJson(Map<String, dynamic> json) =>
      _$UserSetNickFromJson(json);

  static const toJsonFactory = _$UserSetNickToJson;
  Map<String, dynamic> toJson() => _$UserSetNickToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$UserSetNickFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserSetNick &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $UserSetNickExtension on UserSetNick {
  UserSetNick copyWith({int? id, String? name}) {
    return UserSetNick(id: id ?? this.id, name: name ?? this.name);
  }

  UserSetNick copyWithWrapped({Wrapped<int>? id, Wrapped<String?>? name}) {
    return UserSetNick(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class UserStorageFoodDetail {
  UserStorageFoodDetail({
    this.id,
    this.count,
    this.user,
    this.food,
  });

  factory UserStorageFoodDetail.fromJson(Map<String, dynamic> json) =>
      _$UserStorageFoodDetailFromJson(json);

  static const toJsonFactory = _$UserStorageFoodDetailToJson;
  Map<String, dynamic> toJson() => _$UserStorageFoodDetailToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'user')
  final int? user;
  @JsonKey(name: 'food')
  final int? food;
  static const fromJsonFactory = _$UserStorageFoodDetailFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserStorageFoodDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.food, food) ||
                const DeepCollectionEquality().equals(other.food, food)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(food) ^
      runtimeType.hashCode;
}

extension $UserStorageFoodDetailExtension on UserStorageFoodDetail {
  UserStorageFoodDetail copyWith({int? id, int? count, int? user, int? food}) {
    return UserStorageFoodDetail(
        id: id ?? this.id,
        count: count ?? this.count,
        user: user ?? this.user,
        food: food ?? this.food);
  }

  UserStorageFoodDetail copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<int?>? count,
      Wrapped<int?>? user,
      Wrapped<int?>? food}) {
    return UserStorageFoodDetail(
        id: (id != null ? id.value : this.id),
        count: (count != null ? count.value : this.count),
        user: (user != null ? user.value : this.user),
        food: (food != null ? food.value : this.food));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
