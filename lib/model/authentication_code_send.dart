part of swagger.api;

class AuthenticationCodeSend {
  
  String? phoneNumber = null;
  
  AuthenticationCodeSend();

  @override
  String toString() {
    return 'AuthenticationCodeSend[phoneNumber=$phoneNumber, ]';
  }

  AuthenticationCodeSend.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    phoneNumber =
        json['phone_number']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber
     };
  }

  static List<AuthenticationCodeSend> listFromJson(List<dynamic> json) {
    return json == null ? new List<AuthenticationCodeSend>.empty() : json.map((value) => new AuthenticationCodeSend.fromJson(value)).toList();
  }

  static Map<String, AuthenticationCodeSend> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AuthenticationCodeSend>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AuthenticationCodeSend.fromJson(value));
    }
    return map;
  }
}

