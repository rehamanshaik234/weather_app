class Wind {
  Wind({
      this.speed, 
      this.deg, 
      this.gust,});

  Wind.fromJson(dynamic json) {
    speed = json['speed'].toString();
    deg = json['deg'].toString();
    gust = json['gust'].toString();
  }
  String? speed;
  String? deg;
  String? gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    return map;
  }

}