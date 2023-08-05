import 'package:weather_report/models/List.dart';

import 'City.dart';

class WeatherModel {
  WeatherModel({
      this.cod, 
      this.message, 
      this.cnt, 
      this.list, 
      this.city,});

  WeatherModel.fromJson(dynamic json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list!.add(WeatherList.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  String? cod;
  int? message;
  int? cnt;
  List<WeatherList>? list;
  City? city;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    if (list != null) {
      map['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map['city'] = city!.toJson();
    }
    return map;
  }

}