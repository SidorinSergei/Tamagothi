part of swagger.api;

class CategoriesApi {
  final ApiClient apiClient;

  CategoriesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  Future<CategoryDetail> categoriesCreate(CategoryDetail? data) async {
    if (data == null) {
      throw ApiException(400, "Missing required param: data");
    }
    var postBody = data;

    var path = "/categories/".replaceAll("{format}", "json");

    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};
    var contentTypes = ["application/json"];
    var contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    var authNames = ["Basic"];

    var response = await apiClient.invokeAPI(path, 'POST', queryParams, postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'CategoryDetail') as CategoryDetail;
    } else {
      throw ApiException(500, 'Server returned null response');
    }
  }

  Future<void> categoriesDelete(String? id) async {
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    var path = "/categories/{id}/".replaceAll("{format}", "json").replaceAll("{id}", id);

    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};
    var contentTypes = ["application/json"];
    var contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    var authNames = ["Basic"];

    var response = await apiClient.invokeAPI(path, 'DELETE', queryParams, {}, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    }
  }

  Future<List<CategoryDetail>> categoriesList() async {
    var path = "/categories/".replaceAll("{format}", "json");

    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};
    var contentTypes = ["application/json"];
    var contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    var authNames = ["Basic"];

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, {}, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return (apiClient.deserialize(response.body, 'List<CategoryDetail>') as List)
          .map((item) => item as CategoryDetail)
          .toList();
    } else {
      throw ApiException(500, 'Server returned null response');
    }
  }

  Future<CategoryDetail> categoriesPartialUpdate(String? id, CategoryDetail? data) async {
    if (id == null || data == null) {
      throw ApiException(400, "Missing required param: id or data");
    }

    var postBody = data;
    var path = "/categories/{id}/".replaceAll("{format}", "json").replaceAll("{id}", id);

    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};
    var contentTypes = ["application/json"];
    var contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    var authNames = ["Basic"];

    var response = await apiClient.invokeAPI(path, 'PATCH', queryParams, postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'CategoryDetail') as CategoryDetail;
    } else {
      throw ApiException(500, 'Server returned null response');
    }
  }

  Future<CategoryDetail> categoriesRead(String? id) async {
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    var path = "/categories/{id}/".replaceAll("{format}", "json").replaceAll("{id}", id);

    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};
    var contentTypes = ["application/json"];
    var contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    var authNames = ["Basic"];

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, {}, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'CategoryDetail') as CategoryDetail;
    } else {
      throw ApiException(500, 'Server returned null response');
    }
  }

  Future<CategoryDetail> categoriesUpdate(String? id, CategoryDetail? data) async {
    if (id == null || data == null) {
      throw ApiException(400, "Missing required param: id or data");
    }

    var postBody = data;
    var path = "/categories/{id}/".replaceAll("{format}", "json").replaceAll("{id}", id);

    var queryParams = <QueryParam>[];
    var headerParams = <String, String>{};
    var formParams = <String, String>{};
    var contentTypes = ["application/json"];
    var contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    var authNames = ["Basic"];

    var response = await apiClient.invokeAPI(path, 'PUT', queryParams, postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'CategoryDetail') as CategoryDetail;
    } else {
      throw ApiException(500, 'Server returned null response');
    }
  }
}
