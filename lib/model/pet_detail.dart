part of swagger.api;

class PetDetail {
  
  int? id = null;
  

  String? name = null;
  

  int? age = null;
   // range from -2147483648 to 2147483647//

  bool? isMale = null;
  

  int? moodPoints = null;
   // range from 0 to 100//

  int? purityPoints = null;
   // range from 0 to 100//

  int? starvationPoints = null;
   // range from 0 to 100//

  int? user = null;
  

  int? personality = null;
  
  PetDetail();

  @override
  String toString() {
    return 'PetDetail[id=$id, name=$name, age=$age, isMale=$isMale, moodPoints=$moodPoints, purityPoints=$purityPoints, starvationPoints=$starvationPoints, user=$user, personality=$personality, ]';
  }

  PetDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    age =
        json['age']
    ;
    isMale =
        json['is_male']
    ;
    moodPoints =
        json['mood_points']
    ;
    purityPoints =
        json['purity_points']
    ;
    starvationPoints =
        json['starvation_points']
    ;
    user =
        json['user']
    ;
    personality =
        json['personality']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'is_male': isMale,
      'mood_points': moodPoints,
      'purity_points': purityPoints,
      'starvation_points': starvationPoints,
      'user': user,
      'personality': personality
     };
  }

  static List<PetDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<PetDetail>.empty() : json.map((value) => new PetDetail.fromJson(value)).toList();
  }

  static Map<String, PetDetail> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PetDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PetDetail.fromJson(value));
    }
    return map;
  }
}

