part of swagger.api;

class CategoryDetail {
  
  int? id = null;
  

  String? categoryName = null;
  
  CategoryDetail();

  @override
  String toString() {
    return 'CategoryDetail[id=$id, categoryName=$categoryName, ]';
  }

  CategoryDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    categoryName =
        json['category_name']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_name': categoryName
     };
  }

  static List<CategoryDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<CategoryDetail>.empty() : json.map((value) => new CategoryDetail.fromJson(value)).toList();
  }

  static Map<String, CategoryDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CategoryDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CategoryDetail.fromJson(value));
    }
    return map;
  }
}

