part of swagger.api;

class PersonalityDetail {
  
  int? id = null;
  

  String? personality = null;
  

  int? category = null;
  
  PersonalityDetail();

  @override
  String toString() {
    return 'PersonalityDetail[id=$id, personality=$personality, category=$category, ]';
  }

  PersonalityDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    personality =
        json['personality']
    ;
    category =
        json['category']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'personality': personality,
      'category': category
     };
  }

  static List<PersonalityDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<PersonalityDetail>.empty() : json.map((value) => new PersonalityDetail.fromJson(value)).toList();
  }

  static Map<String, PersonalityDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PersonalityDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PersonalityDetail.fromJson(value));
    }
    return map;
  }
}

