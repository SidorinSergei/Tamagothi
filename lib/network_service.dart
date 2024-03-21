import "swagger_generated_api/app_api.swagger.dart";

class NetworkService {
  late final AppApi networkService;

  NetworkService() {
    networkService = AppApi.create();
  }
}