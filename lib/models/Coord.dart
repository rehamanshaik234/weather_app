class Coord {
  Coord({
      this.lat, 
      this.lon,});

  Coord.fromJson(dynamic json) {
    lat = json['lat'].toString();
    lon = json['lon'].toString();
  }
  String? lat;
  String? lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }

}