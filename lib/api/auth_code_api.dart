part of swagger.api;



class AuthCodeApi {
  final ApiClient apiClient;

  AuthCodeApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Send authentication code.
  Future<AuthenticationCodeSend> authCodeSendCreate(AuthenticationCodeSend data) async {
    Object postBody = data;

    if(data == null) {
      throw ApiException(400, "Missing required param: data");
    }

    String path = "/auth_code/send/".replaceAll("{format}", "json");

    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.isNotEmpty ? contentTypes.first : "application/json";
    List<String> authNames = ["Basic"];

    var response = await apiClient.invokeAPI(
        path,
        'POST',
        queryParams,
        postBody,
        headerParams,
        formParams,
        contentType,
        authNames
    );

    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'AuthenticationCodeSend') as AuthenticationCodeSend;
    } else {
      throw ApiException(500, 'Server error: Expected a response body but found none');
    }
  }

  /// Verify authentication code.
  Future<AuthenticationCodeVerify> authCodeVerifyCreate(AuthenticationCodeVerify data) async {
    Object postBody = data;

    if(data == null) {
      throw ApiException(400, "Missing required param: data");
    }

    String path = "/auth_code/verify/".replaceAll("{format}", "json");

    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.isNotEmpty ? contentTypes.first : "application/json";
    List<String> authNames = ["Basic"];

    var response = await apiClient.invokeAPI(
        path,
        'POST',
        queryParams,
        postBody,
        headerParams,
        formParams,
        contentType,
        authNames
    );

    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'AuthenticationCodeVerify') as AuthenticationCodeVerify;
    } else {
      throw ApiException(500, 'Server error: Expected a response body but found none');
    }
  }
}
