// To parse this JSON data, do
//
//     final cityweather = cityweatherFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

Cityweather cityweatherFromJson(String str) => Cityweather.fromJson(json.decode(str));

String cityweatherToJson(Cityweather data) => json.encode(data.toJson());

class Cityweather {
    Cityweather({
        required this.weather,
        required this.main,
        required this.name,
        required this.cod,
    });

    List<Weather> weather;
    Main main;
    String name;
    int cod;

    factory Cityweather.fromJson(Map<String, dynamic> json) => Cityweather(
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "name": name,
        "cod": cod,
    };
}

class Main {
    Main({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
    });

    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
    };
}

class Weather {
    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}
