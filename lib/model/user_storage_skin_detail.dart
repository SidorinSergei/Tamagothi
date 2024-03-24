part of swagger.api;

class UserStorageSkinDetail {
  
  int? id = null;
  

  int? user = null;


  int? skin = null;
  
  UserStorageSkinDetail();

  @override
  String toString() {
    return 'UserStorageSkinDetail[id=$id, user=$user, skin=$skin, ]';
  }

  UserStorageSkinDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    user =
        json['user']
    ;
    skin =
        json['skin']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'skin': skin
     };
  }

  static List<UserStorageSkinDetail> listFromJson(List<dynamic> json) {
    return json == null ? <UserStorageSkinDetail>[] : json.map((value) => UserStorageSkinDetail.fromJson(value)).toList();
  }

  static Map<String, UserStorageSkinDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserStorageSkinDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserStorageSkinDetail.fromJson(value));
    }
    return map;
  }
}

