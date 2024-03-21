part of swagger.api;

class AdminDetail {
  
  int? id = null;
  

  String? login = null;
  

  String? password = null;
  
  AdminDetail();

  @override
  String toString() {
    return 'AdminDetail[id=$id, login=$login, password=$password, ]';
  }

  AdminDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    login =
        json['login']
    ;
    password =
        json['password']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'password': password
     };
  }

  static List<AdminDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<AdminDetail>.empty() : json.map((value) => new AdminDetail.fromJson(value)).toList();
  }

  static Map<String, AdminDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AdminDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AdminDetail.fromJson(value));
    }
    return map;
  }
}

