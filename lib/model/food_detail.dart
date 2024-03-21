part of swagger.api;

class FoodDetail {
  
  int? id = null;
  

  String? name = null;
  

  int? price = null;
   // range from -2147483648 to 2147483647//

  int? saturation = null;
   // range from -2147483648 to 2147483647//
  FoodDetail();

  @override
  String toString() {
    return 'FoodDetail[id=$id, name=$name, price=$price, saturation=$saturation, ]';
  }

  FoodDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    price =
        json['price']
    ;
    saturation =
        json['saturation']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'saturation': saturation
     };
  }

  static List<FoodDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<FoodDetail>.empty() : json.map((value) => new FoodDetail.fromJson(value)).toList();
  }

  static Map<String, FoodDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, FoodDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new FoodDetail.fromJson(value));
    }
    return map;
  }
}

