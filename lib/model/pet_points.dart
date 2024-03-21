part of swagger.api;

class PetPoints {
  
  int? moodPoints = null;
   // range from 0 to 100//

  int? purityPoints = null;
   // range from 0 to 100//

  int? starvationPoints = null;
   // range from 0 to 100//
  PetPoints();

  @override
  String toString() {
    return 'PetPoints[moodPoints=$moodPoints, purityPoints=$purityPoints, starvationPoints=$starvationPoints, ]';
  }

  PetPoints.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    moodPoints =
        json['mood_points']
    ;
    purityPoints =
        json['purity_points']
    ;
    starvationPoints =
        json['starvation_points']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'mood_points': moodPoints,
      'purity_points': purityPoints,
      'starvation_points': starvationPoints
     };
  }

  static List<PetPoints> listFromJson(List<dynamic> json) {
    return json == null ? new List<PetPoints>.empty() : json.map((value) => new PetPoints.fromJson(value)).toList();
  }

  static Map<String, PetPoints> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PetPoints>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PetPoints.fromJson(value));
    }
    return map;
  }
}

