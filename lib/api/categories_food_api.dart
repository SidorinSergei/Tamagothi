part of swagger.api;



class CategoriesFoodApi {
  final ApiClient apiClient;

  CategoriesFoodApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<CategoryFoodDetail> categoriesFoodCreate(CategoryFoodDetail data) async {
    Object postBody = data;

    // verify required params are set
    if(data == null) {
     throw new ApiException(400, "Missing required param: data");
    }

    // create path and map variables
    String path = "/categories_food/".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'CategoryFoodDetail') as CategoryFoodDetail ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future categoriesFoodDelete(String category) async {
    Object postBody = null;

    // verify required params are set
    if(category == null) {
     throw new ApiException(400, "Missing required param: category");
    }

    // create path and map variables
    String path = "/categories_food/{category}/".replaceAll("{format}","json").replaceAll("{" + "category" + "}", category.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'DELETE',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          ;
    } else {
      return ;
    }
  }
  /// 
  ///
  /// 
  Future<List<CategoryFoodDetail>> categoriesFoodList() async {
    Object postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/categories_food/".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
        (apiClient.deserialize(response.body, 'List<CategoryFoodDetail>') as List).map((item) => item as CategoryFoodDetail).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<CategoryFoodDetail> categoriesFoodPartialUpdate(String category, CategoryFoodDetail data) async {
    Object postBody = data;

    // verify required params are set
    if(category == null) {
     throw new ApiException(400, "Missing required param: category");
    }
    if(data == null) {
     throw new ApiException(400, "Missing required param: data");
    }

    // create path and map variables
    String path = "/categories_food/{category}/".replaceAll("{format}","json").replaceAll("{" + "category" + "}", category.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'PATCH',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'CategoryFoodDetail') as CategoryFoodDetail ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<CategoryFoodDetail> categoriesFoodRead(String category) async {
    Object postBody = null;

    // verify required params are set
    if(category == null) {
     throw new ApiException(400, "Missing required param: category");
    }

    // create path and map variables
    String path = "/categories_food/{category}/".replaceAll("{format}","json").replaceAll("{" + "category" + "}", category.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'CategoryFoodDetail') as CategoryFoodDetail ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<CategoryFoodDetail> categoriesFoodUpdate(String category, CategoryFoodDetail data) async {
    Object postBody = data;

    // verify required params are set
    if(category == null) {
     throw new ApiException(400, "Missing required param: category");
    }
    if(data == null) {
     throw new ApiException(400, "Missing required param: data");
    }

    // create path and map variables
    String path = "/categories_food/{category}/".replaceAll("{format}","json").replaceAll("{" + "category" + "}", category.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["Basic"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'PUT',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'CategoryFoodDetail') as CategoryFoodDetail ;
    } else {
      return null;
    }
  }
}
