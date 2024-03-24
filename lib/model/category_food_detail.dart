part of swagger.api;

class CategoryFoodDetail {
  
  int? category = null;
  

  int? food = null;
  
  CategoryFoodDetail();

  @override
  String toString() {
    return 'CategoryFoodDetail[category=$category, food=$food, ]';
  }

  CategoryFoodDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    category =
        json['category']
    ;
    food =
        json['food']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'food': food
     };
  }

  static List<CategoryFoodDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<CategoryFoodDetail>.empty() : json.map((value) => new CategoryFoodDetail.fromJson(value)).toList();
  }

  static Map<String, CategoryFoodDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CategoryFoodDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CategoryFoodDetail.fromJson(value));
    }
    return map;
  }
}

