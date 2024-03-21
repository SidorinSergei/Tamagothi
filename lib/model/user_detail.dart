part of swagger.api;

class UserDetail {

  int? id = null;


  String? name = null;


  String? phoneNumber = null;


  DateTime? createdAt = null;


  int? balance = null;
   // range from -2147483648 to 2147483647//
  UserDetail();

  @override
  String toString() {
    return 'UserDetail[id=$id, name=$name, phoneNumber=$phoneNumber, createdAt=$createdAt, balance=$balance, ]';
  }

  UserDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    phoneNumber =
        json['phone_number']
    ;
    createdAt =


        createdAt = json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
;
    balance =
        json['balance']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'created_at': createdAt,
      'balance': balance
     };
  }

  static List<UserDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserDetail>.empty() : json.map((value) => new UserDetail.fromJson(value)).toList();
  }

  static Map<String, UserDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserDetail.fromJson(value));
    }
    return map;
  }
}

