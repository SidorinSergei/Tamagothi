part of swagger.api;

class AdminsApi {
  final ApiClient apiClient;

  AdminsApi(this.apiClient);

  Future<AdminDetail?> adminsCreate(AdminDetail? data) async {
    if (data == null) {
      throw ApiException(400, "Missing required param: data");
    }
    String path = "/admins/".replaceAll("{format}", "json");
    String contentType = "application/json";
    List<String> authNames = ["Basic"];
    var response = await apiClient.invokeAPI(path, 'POST', [], data, {}, {}, contentType, authNames);
    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'AdminDetail');
    } else {
      return null;
    }
  }

  Future<void> adminsDelete(String? id) async {
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }
    String path = "/admins/{id}/".replaceAll("{format}", "json").replaceAll("{" + "id" + "}", id);
    List<String> authNames = ["Basic"];
    var response = await apiClient.invokeAPI(path, 'DELETE', [], "", {}, {}, "", authNames);
    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    }
  }

  Future<List<AdminDetail>?> adminsList() async {
    String path = "/admins/".replaceAll("{format}", "json");
    List<String> authNames = ["Basic"];
    var response = await apiClient.invokeAPI(path, 'GET', [], "", {}, {}, "", authNames);
    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return (apiClient.deserialize(response.body, 'List<AdminDetail>') as List)
          .cast<AdminDetail>();
    } else {
      return null;
    }
  }

  Future<AdminDetail?> adminsPartialUpdate(String? id, AdminDetail? data) async {
    if (id == null || data == null) {
      throw ApiException(400, "Missing required param: id or data");
    }
    String path = "/admins/{id}/".replaceAll("{format}", "json").replaceAll("{" + "id" + "}", id);
    List<String> authNames = ["Basic"];
    var response = await apiClient.invokeAPI(path, 'PATCH', [], data, {}, {}, "application/json", authNames);
    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'AdminDetail');
    } else {
      return null;
    }
  }

  Future<AdminDetail?> adminsRead(String? id) async {
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }
    String path = "/admins/{id}/".replaceAll("{format}", "json").replaceAll("{" + "id" + "}", id);
    List<String> authNames = ["Basic"];
    var response = await apiClient.invokeAPI(path, 'GET', [], "", {}, {}, "", authNames);
    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'AdminDetail');
    } else {
      return null;
    }
  }

  Future<AdminDetail?> adminsUpdate(String? id, AdminDetail? data) async {
    if (id == null || data == null) {
      throw ApiException(400, "Missing required param: id or data");
    }
    String path = "/admins/{id}/".replaceAll("{format}", "json").replaceAll("{" + "id" + "}", id);
    List<String> authNames = ["Basic"];
    var response = await apiClient.invokeAPI(path, 'PUT', [], data, {}, {}, "application/json", authNames);
    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'AdminDetail');
    } else {
      return null;
    }
  }
}
