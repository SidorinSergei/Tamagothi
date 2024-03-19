part of swagger.api;

class PetPointsIncrease {
  
  int? petId = null;
  

  String? characteristic = null;
  

  int? value = null;
  
  PetPointsIncrease();

  @override
  String toString() {
    return 'PetPointsIncrease[petId=$petId, characteristic=$characteristic, value=$value, ]';
  }

  PetPointsIncrease.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    petId =
        json['pet_id']
    ;
    characteristic =
        json['characteristic']
    ;
    value =
        json['value']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'pet_id': petId,
      'characteristic': characteristic,
      'value': value
     };
  }

  static List<PetPointsIncrease> listFromJson(List<dynamic> json) {
    return json == null ? new List<PetPointsIncrease>.empty() : json.map((value) => new PetPointsIncrease.fromJson(value)).toList();
  }

  static Map<String, PetPointsIncrease> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PetPointsIncrease>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PetPointsIncrease.fromJson(value));
    }
    return map;
  }
}

