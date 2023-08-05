import 'Coord.dart';

class City {
  City({
      this.id, 
      this.name, 
      this.coord, 
      this.country, 
      this.population, 
      this.timezone, 
      this.sunrise, 
      this.sunset,});

  City.fromJson(dynamic json) {
    id = json['id'].toString();
    name = json['name'].toString();
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'].toString();
    population = json['population'].toString();
    timezone = json['timezone'].toString();
    sunrise = json['sunrise'].toString();
    sunset = json['sunset'].toString();
  }
  String? id;
  String? name;
  Coord? coord;
  String? country;
  String? population;
  String? timezone;
  String? sunrise;
  String? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (coord != null) {
      map['coord'] = coord!.toJson();
    }
    map['country'] = country;
    map['population'] = population;
    map['timezone'] = timezone;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}