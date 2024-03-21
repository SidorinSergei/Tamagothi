part of swagger.api;

class BuyApi {
  final ApiClient apiClient;

  // Исправлено: указываем, что apiClient может быть null и предоставляем defaultApiClient, если он не передан
  BuyApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  Future<BuyFood> buyFoodCreate(BuyFood data) async {
    Object postBody = data;

    // Исправлено: Убедимся, что data не равно null перед его использованием
    if(data == null) {
      throw ApiException(400, "Missing required param: data");
    }

    String path = "/buy/food/".replaceAll("{format}","json");

    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];
    String contentType = contentTypes.isNotEmpty ? contentTypes.first : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // Исправлено: Предоставляем валидные значения для создания MultipartRequest
      MultipartRequest mp = MultipartRequest('POST', Uri.parse(path));

      if(hasFields)
        postBody = mp;
    }

    var response = await apiClient.invokeAPI(path, 'POST', queryParams, postBody, headerParams, formParams, contentType, authNames);

    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      // Используем безопасное приведение типов
      return apiClient.deserialize(response.body, 'BuyFood') as BuyFood;
    } else {
      // Исправлено: Вместо возвращения null, мы бросаем исключение, если тело ответа отсутствует
      throw ApiException(500, "Unexpected error: No response body");
    }
  }

  Future<UserStorageSkinDetail> buySkinCreate(UserStorageSkinDetail data) async {
    Object postBody = data;

    if(data == null) {
      throw ApiException(400, "Missing required param: data");
    }

    String path = "/buy/skin/".replaceAll("{format}","json");

    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];
    String contentType = contentTypes.isNotEmpty ? contentTypes.first : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      // Исправлено: Предоставляем валидные значения для создания MultipartRequest
      MultipartRequest mp = MultipartRequest('POST', Uri.parse(path));

      if(hasFields)
        postBody = mp;
    }

    var response = await apiClient.invokeAPI(path, 'POST', queryParams, postBody, headerParams, formParams, contentType, authNames);

    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      // Используем безопасное приведение типов
      return apiClient.deserialize(response.body, 'UserStorageSkinDetail') as UserStorageSkinDetail;
    } else {
      // Исправлено: Вместо возвращения null, мы бросаем исключение, если тело ответа отсутствует
      throw ApiException(500, "Unexpected error: No response body");
    }
  }
}
