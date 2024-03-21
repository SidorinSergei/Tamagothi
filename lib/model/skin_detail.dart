part of swagger.api;

class SkinDetail {
  
  int? id = null;
  

  String? type = null;
  

  String? description = null;
  

  int? price = null;
   // range from -2147483648 to 2147483647//
  SkinDetail();

  @override
  String toString() {
    return 'SkinDetail[id=$id, type=$type, description=$description, price=$price, ]';
  }

  SkinDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    type =
        json['type']
    ;
    description =
        json['description']
    ;
    price =
        json['price']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'description': description,
      'price': price
     };
  }

  static List<SkinDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<SkinDetail>.empty() : json.map((value) => new SkinDetail.fromJson(value)).toList();
  }

  static Map<String, SkinDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SkinDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SkinDetail.fromJson(value));
    }
    return map;
  }
}

