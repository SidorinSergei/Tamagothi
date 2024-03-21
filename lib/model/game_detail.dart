part of swagger.api;

class GameDetail {
  
  int? id = null;
  

  int? points = null;
   // range from -2147483648 to 2147483647//

  int? user = null;
  
  GameDetail();

  @override
  String toString() {
    return 'GameDetail[id=$id, points=$points, user=$user, ]';
  }

  GameDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    points =
        json['points']
    ;
    user =
        json['user']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'points': points,
      'user': user
     };
  }

  static List<GameDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<GameDetail>.empty() : json.map((value) => new GameDetail.fromJson(value)).toList();
  }

  static Map<String, GameDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, GameDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new GameDetail.fromJson(value));
    }
    return map;
  }
}

