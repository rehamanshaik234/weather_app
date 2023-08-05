class Main {
  Main({
      this.temp, 
      this.feelsLike, 
      this.tempMin, 
      this.tempMax, 
      this.pressure, 
      this.seaLevel, 
      this.grndLevel, 
      this.humidity, 
      this.tempKf,});

  Main.fromJson(dynamic json) {
    temp = json['temp'].toString();
    feelsLike = json['feels_like'].toString();
    tempMin = json['temp_min'].toString();
    tempMax = json['temp_max'].toString();
    pressure = json['pressure'].toString();
    seaLevel = json['sea_level'].toString();
    grndLevel = json['grnd_level'].toString();
    humidity = json['humidity'].toString();
    tempKf = json['temp_kf'].toString();
  }
  String? temp;
  String? feelsLike;
  String? tempMin;
  String? tempMax;
  String? pressure;
  String? seaLevel;
  String? grndLevel;
  String? humidity;
  String? tempKf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['sea_level'] = seaLevel;
    map['grnd_level'] = grndLevel;
    map['humidity'] = humidity;
    map['temp_kf'] = tempKf;
    return map;
  }

}