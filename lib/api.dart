library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/admins_api.dart';
part 'api/auth_code_api.dart';
part 'api/buy_api.dart';
part 'api/categories_api.dart';
part 'api/categories_food_api.dart';
part 'api/food_api.dart';
part 'api/games_api.dart';
part 'api/personality_api.dart';
part 'api/pets_api.dart';
part 'api/skin_api.dart';
part 'api/user_profiles_api.dart';
part 'api/user_storage_food_api.dart';
part 'api/user_storage_skin_api.dart';

part 'model/admin_detail.dart';
part 'model/authentication_code_send.dart';
part 'model/authentication_code_verify.dart';
part 'model/buy_food.dart';
part 'model/category_detail.dart';
part 'model/category_food_detail.dart';
part 'model/food_detail.dart';
part 'model/game_detail.dart';
part 'model/personality_detail.dart';
part 'model/pet_detail.dart';
part 'model/pet_points.dart';
part 'model/pet_points_increase.dart';
part 'model/skin_detail.dart';
part 'model/user_detail.dart';
part 'model/user_storage_food_detail.dart';
part 'model/user_storage_skin_detail.dart';


ApiClient defaultApiClient = new ApiClient();
