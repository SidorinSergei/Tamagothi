part of swagger.api;

class UserStorageFoodDetail {
  
  int? id = null;
  

  int? count = null;
   // range from -2147483648 to 2147483647//

  int? user = null;
  

  int? food = null;
  
  UserStorageFoodDetail();

  @override
  String toString() {
    return 'UserStorageFoodDetail[id=$id, count=$count, user=$user, food=$food, ]';
  }

  UserStorageFoodDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    count =
        json['count']
    ;
    user =
        json['user']
    ;
    food =
        json['food']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
      'user': user,
      'food': food
     };
  }

  static List<UserStorageFoodDetail> listFromJson(List<dynamic> json) {
    return json == null ?  List<UserStorageFoodDetail>.empty() : json.map((value) => new UserStorageFoodDetail.fromJson(value)).toList();
  }

  static Map<String, UserStorageFoodDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserStorageFoodDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserStorageFoodDetail.fromJson(value));
    }
    return map;
  }
}

