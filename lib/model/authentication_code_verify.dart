part of swagger.api;

class AuthenticationCodeVerify {
  
  String? phoneNumber = null;
  

  String? code = null;
  
  AuthenticationCodeVerify();

  @override
  String toString() {
    return 'AuthenticationCodeVerify[phoneNumber=$phoneNumber, code=$code, ]';
  }

  AuthenticationCodeVerify.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    phoneNumber =
        json['phone_number']
    ;
    code =
        json['code']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
      'code': code
     };
  }

  static List<AuthenticationCodeVerify> listFromJson(List<dynamic> json) {
    return json == null ? new List<AuthenticationCodeVerify>.empty() : json.map((value) => new AuthenticationCodeVerify.fromJson(value)).toList();
  }

  static Map<String, AuthenticationCodeVerify> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AuthenticationCodeVerify>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AuthenticationCodeVerify.fromJson(value));
    }
    return map;
  }
}

