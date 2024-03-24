part of swagger.api;

class BuyFood {
  
  int? user = null;
  

  int? food = null;
  
  BuyFood();

  @override
  String toString() {
    return 'BuyFood[user=$user, food=$food, ]';
  }

  BuyFood.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    user =
        json['user']
    ;
    food =
        json['food']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'food': food
     };
  }

  static List<BuyFood> listFromJson(List<dynamic> json) {
    return json == null ? new List<BuyFood>.empty() : json.map((value) => new BuyFood.fromJson(value)).toList();
  }

  static Map<String, BuyFood> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, BuyFood>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BuyFood.fromJson(value));
    }
    return map;
  }
}

