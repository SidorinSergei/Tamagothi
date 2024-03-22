//Generated code

part of 'app_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AppApi extends AppApi {
  _$AppApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AppApi;

  @override
  Future<Response<List<AdminDetail>>> _adminsGet() {
    final Uri $url = Uri.parse('/admins/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AdminDetail>, AdminDetail>($request);
  }

  @override
  Future<Response<AdminDetail>> _adminsPost({required AdminDetail? data}) {
    final Uri $url = Uri.parse('/admins/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AdminDetail, AdminDetail>($request);
  }

  @override
  Future<Response<AdminDetail>> _adminsIdGet({required String? id}) {
    final Uri $url = Uri.parse('/admins/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AdminDetail, AdminDetail>($request);
  }

  @override
  Future<Response<AdminDetail>> _adminsIdPut({
    required AdminDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/admins/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AdminDetail, AdminDetail>($request);
  }

  @override
  Future<Response<AdminDetail>> _adminsIdPatch({
    required AdminDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/admins/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AdminDetail, AdminDetail>($request);
  }

  @override
  Future<Response<dynamic>> _adminsIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/admins/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AuthenticationCodeSend>> _authCodeSendPost(
      {required AuthenticationCodeSend? data}) {
    final Uri $url = Uri.parse('/auth_code/send/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<AuthenticationCodeSend, AuthenticationCodeSend>($request);
  }

  @override
  Future<Response<AuthenticationCodeVerify>> _authCodeVerifyPost(
      {required AuthenticationCodeVerify? data}) {
    final Uri $url = Uri.parse('/auth_code/verify/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<AuthenticationCodeVerify, AuthenticationCodeVerify>($request);
  }

  @override
  Future<Response<BuyFood>> _buyFoodPost({required BuyFood? data}) {
    final Uri $url = Uri.parse('/buy/food/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BuyFood, BuyFood>($request);
  }

  @override
  Future<Response<UserStorageSkinDetail>> _buySkinPost(
      {required UserStorageSkinDetail? data}) {
    final Uri $url = Uri.parse('/buy/skin/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserStorageSkinDetail, UserStorageSkinDetail>($request);
  }

  @override
  Future<Response<List<CategoryDetail>>> _categoriesGet() {
    final Uri $url = Uri.parse('/categories/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CategoryDetail>, CategoryDetail>($request);
  }

  @override
  Future<Response<CategoryDetail>> _categoriesPost(
      {required CategoryDetail? data}) {
    final Uri $url = Uri.parse('/categories/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryDetail, CategoryDetail>($request);
  }

  @override
  Future<Response<CategoryDetail>> _categoriesIdGet({required String? id}) {
    final Uri $url = Uri.parse('/categories/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CategoryDetail, CategoryDetail>($request);
  }

  @override
  Future<Response<CategoryDetail>> _categoriesIdPut({
    required CategoryDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/categories/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryDetail, CategoryDetail>($request);
  }

  @override
  Future<Response<CategoryDetail>> _categoriesIdPatch({
    required CategoryDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/categories/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryDetail, CategoryDetail>($request);
  }

  @override
  Future<Response<dynamic>> _categoriesIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/categories/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<CategoryFoodDetail>>> _categoriesFoodGet() {
    final Uri $url = Uri.parse('/categories_food/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CategoryFoodDetail>, CategoryFoodDetail>($request);
  }

  @override
  Future<Response<CategoryFoodDetail>> _categoriesFoodPost(
      {required CategoryFoodDetail? data}) {
    final Uri $url = Uri.parse('/categories_food/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryFoodDetail, CategoryFoodDetail>($request);
  }

  @override
  Future<Response<CategoryFoodDetail>> _categoriesFoodCategoryGet(
      {required String? category}) {
    final Uri $url = Uri.parse('/categories_food/${category}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CategoryFoodDetail, CategoryFoodDetail>($request);
  }

  @override
  Future<Response<CategoryFoodDetail>> _categoriesFoodCategoryPut({
    required CategoryFoodDetail? data,
    required String? category,
  }) {
    final Uri $url = Uri.parse('/categories_food/${category}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryFoodDetail, CategoryFoodDetail>($request);
  }

  @override
  Future<Response<CategoryFoodDetail>> _categoriesFoodCategoryPatch({
    required CategoryFoodDetail? data,
    required String? category,
  }) {
    final Uri $url = Uri.parse('/categories_food/${category}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CategoryFoodDetail, CategoryFoodDetail>($request);
  }

  @override
  Future<Response<dynamic>> _categoriesFoodCategoryDelete(
      {required String? category}) {
    final Uri $url = Uri.parse('/categories_food/${category}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<FoodDetail>>> _foodGet() {
    final Uri $url = Uri.parse('/food/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<FoodDetail>, FoodDetail>($request);
  }

  @override
  Future<Response<FoodDetail>> _foodPost({required FoodDetail? data}) {
    final Uri $url = Uri.parse('/food/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<FoodDetail, FoodDetail>($request);
  }

  @override
  Future<Response<FoodDetail>> _foodIdGet({required String? id}) {
    final Uri $url = Uri.parse('/food/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<FoodDetail, FoodDetail>($request);
  }

  @override
  Future<Response<FoodDetail>> _foodIdPut({
    required FoodDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/food/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<FoodDetail, FoodDetail>($request);
  }

  @override
  Future<Response<FoodDetail>> _foodIdPatch({
    required FoodDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/food/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<FoodDetail, FoodDetail>($request);
  }

  @override
  Future<Response<dynamic>> _foodIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/food/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<GameDetail>>> _gamesGet() {
    final Uri $url = Uri.parse('/games/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<GameDetail>, GameDetail>($request);
  }

  @override
  Future<Response<GameDetail>> _gamesPost({required GameDetail? data}) {
    final Uri $url = Uri.parse('/games/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<GameDetail, GameDetail>($request);
  }

  @override
  Future<Response<GameDetail>> _gamesIdGet({required String? id}) {
    final Uri $url = Uri.parse('/games/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GameDetail, GameDetail>($request);
  }

  @override
  Future<Response<GameDetail>> _gamesIdPut({
    required GameDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/games/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<GameDetail, GameDetail>($request);
  }

  @override
  Future<Response<GameDetail>> _gamesIdPatch({
    required GameDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/games/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<GameDetail, GameDetail>($request);
  }

  @override
  Future<Response<dynamic>> _gamesIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/games/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<PersonalityDetail>>> _personalityGet() {
    final Uri $url = Uri.parse('/personality/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<PersonalityDetail>, PersonalityDetail>($request);
  }

  @override
  Future<Response<PersonalityDetail>> _personalityPost(
      {required PersonalityDetail? data}) {
    final Uri $url = Uri.parse('/personality/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PersonalityDetail, PersonalityDetail>($request);
  }

  @override
  Future<Response<PersonalityDetail>> _personalityIdGet({required String? id}) {
    final Uri $url = Uri.parse('/personality/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PersonalityDetail, PersonalityDetail>($request);
  }

  @override
  Future<Response<PersonalityDetail>> _personalityIdPut({
    required PersonalityDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/personality/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PersonalityDetail, PersonalityDetail>($request);
  }

  @override
  Future<Response<PersonalityDetail>> _personalityIdPatch({
    required PersonalityDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/personality/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PersonalityDetail, PersonalityDetail>($request);
  }

  @override
  Future<Response<dynamic>> _personalityIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/personality/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<PetDetail>>> _petsGet() {
    final Uri $url = Uri.parse('/pets/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<PetDetail>, PetDetail>($request);
  }

  @override
  Future<Response<PetDetail>> _petsPost({required PetDetail? data}) {
    final Uri $url = Uri.parse('/pets/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PetDetail, PetDetail>($request);
  }

  @override
  Future<Response<PetPointsIncrease>> _petsIncreasePost(
      {required PetPointsIncrease? data}) {
    final Uri $url = Uri.parse('/pets/increase/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PetPointsIncrease, PetPointsIncrease>($request);
  }

  @override
  Future<Response<PetDetail>> _petsIdGet({required String? id}) {
    final Uri $url = Uri.parse('/pets/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PetDetail, PetDetail>($request);
  }

  @override
  Future<Response<PetDetail>> _petsIdPut({
    required PetDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/pets/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PetDetail, PetDetail>($request);
  }

  @override
  Future<Response<PetDetail>> _petsIdPatch({
    required PetDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/pets/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PetDetail, PetDetail>($request);
  }

  @override
  Future<Response<dynamic>> _petsIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/pets/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PetPoints>> _petsIdPointsGet({required int? id}) {
    final Uri $url = Uri.parse('/pets/${id}/points/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PetPoints, PetPoints>($request);
  }

  @override
  Future<Response<List<SkinDetail>>> _skinGet() {
    final Uri $url = Uri.parse('/skin/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<SkinDetail>, SkinDetail>($request);
  }

  @override
  Future<Response<SkinDetail>> _skinPost({required SkinDetail? data}) {
    final Uri $url = Uri.parse('/skin/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SkinDetail, SkinDetail>($request);
  }

  @override
  Future<Response<SkinDetail>> _skinIdGet({required String? id}) {
    final Uri $url = Uri.parse('/skin/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SkinDetail, SkinDetail>($request);
  }

  @override
  Future<Response<SkinDetail>> _skinIdPut({
    required SkinDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/skin/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SkinDetail, SkinDetail>($request);
  }

  @override
  Future<Response<SkinDetail>> _skinIdPatch({
    required SkinDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/skin/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SkinDetail, SkinDetail>($request);
  }

  @override
  Future<Response<dynamic>> _skinIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/skin/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<UserDetail>>> _userProfilesGet() {
    final Uri $url = Uri.parse('/user_profiles/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<UserDetail>, UserDetail>($request);
  }

  @override
  Future<Response<UserDetail>> _userProfilesPost({required UserDetail? data}) {
    final Uri $url = Uri.parse('/user_profiles/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserDetail, UserDetail>($request);
  }

  @override
  Future<Response<UserDetail>> _userProfilesIdGet({required String? id}) {
    final Uri $url = Uri.parse('/user_profiles/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserDetail, UserDetail>($request);
  }

  @override
  Future<Response<UserDetail>> _userProfilesIdPut({
    required UserDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/user_profiles/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserDetail, UserDetail>($request);
  }

  @override
  Future<Response<UserDetail>> _userProfilesIdPatch({
    required UserDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/user_profiles/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserDetail, UserDetail>($request);
  }

  @override
  Future<Response<dynamic>> _userProfilesIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/user_profiles/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<UserStorageFoodDetail>>> _userStorageFoodGet() {
    final Uri $url = Uri.parse('/user_storage_food/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<UserStorageFoodDetail>, UserStorageFoodDetail>($request);
  }

  @override
  Future<Response<UserStorageFoodDetail>> _userStorageFoodPost(
      {required UserStorageFoodDetail? data}) {
    final Uri $url = Uri.parse('/user_storage_food/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserStorageFoodDetail, UserStorageFoodDetail>($request);
  }

  @override
  Future<Response<UserStorageFoodDetail>> _userStorageFoodIdGet(
      {required String? id}) {
    final Uri $url = Uri.parse('/user_storage_food/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserStorageFoodDetail, UserStorageFoodDetail>($request);
  }

  @override
  Future<Response<UserStorageFoodDetail>> _userStorageFoodIdPut({
    required UserStorageFoodDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/user_storage_food/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserStorageFoodDetail, UserStorageFoodDetail>($request);
  }

  @override
  Future<Response<UserStorageFoodDetail>> _userStorageFoodIdPatch({
    required UserStorageFoodDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/user_storage_food/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserStorageFoodDetail, UserStorageFoodDetail>($request);
  }

  @override
  Future<Response<dynamic>> _userStorageFoodIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/user_storage_food/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<UserStorageSkinDetail>>> _userStorageSkinGet() {
    final Uri $url = Uri.parse('/user_storage_skin/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<UserStorageSkinDetail>, UserStorageSkinDetail>($request);
  }

  @override
  Future<Response<UserStorageSkinDetail>> _userStorageSkinPost(
      {required UserStorageSkinDetail? data}) {
    final Uri $url = Uri.parse('/user_storage_skin/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserStorageSkinDetail, UserStorageSkinDetail>($request);
  }

  @override
  Future<Response<UserStorageSkinDetail>> _userStorageSkinIdGet(
      {required String? id}) {
    final Uri $url = Uri.parse('/user_storage_skin/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserStorageSkinDetail, UserStorageSkinDetail>($request);
  }

  @override
  Future<Response<UserStorageSkinDetail>> _userStorageSkinIdPut({
    required UserStorageSkinDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/user_storage_skin/${id}/');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserStorageSkinDetail, UserStorageSkinDetail>($request);
  }

  @override
  Future<Response<UserStorageSkinDetail>> _userStorageSkinIdPatch({
    required UserStorageSkinDetail? data,
    required String? id,
  }) {
    final Uri $url = Uri.parse('/user_storage_skin/${id}/');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserStorageSkinDetail, UserStorageSkinDetail>($request);
  }

  @override
  Future<Response<dynamic>> _userStorageSkinIdDelete({required String? id}) {
    final Uri $url = Uri.parse('/user_storage_skin/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
