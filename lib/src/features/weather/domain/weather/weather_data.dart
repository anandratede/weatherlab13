import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/features/weather/domain/weather/weather.dart';

import '../temperature.dart';

class WeatherData {
  WeatherData({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
  });

  factory WeatherData.from(Weather weather) {
    return WeatherData(
      temp: Temperature.celsius(weather.weatherParams.temp),
      minTemp: Temperature.celsius(weather.weatherParams.tempMin),
      maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
      description: weather.weatherInfo[0].main,
      date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
      icon: weather.weatherInfo[0].icon,
    );
  }

  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final String icon;

  String get iconUrl => _mapWeatherConditionToIconUrl(icon);

  String _mapWeatherConditionToIconUrl(String iconCode) {
    // Map weather condition codes to corresponding icon URLs
    switch (iconCode) {
      case '01d': // Clear sky (day)
        return 'https://cdn-icons-png.flaticon.com/512/2570/2570483.png'; // Replace with your icon URL
      case '01n': // Clear sky (night)
        return 'https://static.thenounproject.com/png/1640188-200.png'; // Replace with your icon URL
      case '02d': // Few clouds (day)
        return 'https://cdn-icons-png.flaticon.com/512/3222/3222808.png'; // Replace with your icon URL
      case '02n': // Few clouds (night)
        return 'https://static-00.iconduck.com/assets.00/weather-few-clouds-night-200-icon-512x512-att0d8fj.png'; // Replace with your icon URL
      case '03d': // Scattered clouds (day)
      case '03n': // Scattered clouds (night)
        return 'https://cdn-icons-png.flaticon.com/512/1959/1959333.png'; // Replace with your icon URL
      case '04d': // Broken clouds (day)
      case '04n': // Broken clouds (night)
        return 'https://static.thenounproject.com/png/3267952-200.png'; // Replace with your icon URL
      case '09d': // Shower rain (day)
      case '09n': // Shower rain (night)
        return 'https://cdn3.iconfinder.com/data/icons/picons-weather/57/13_showers-512.png'; // Replace with your icon URL
      case '10d': // Rain (day)
      case '10n': // Rain (night)
        return 'https://cdn-icons-png.flaticon.com/512/116/116251.png'; // Replace with your icon URL
      case '11d': // Thunderstorm (day)
      case '11n': // Thunderstorm (night)
        return 'https://cdn-icons-png.flaticon.com/512/5903/5903432.png'; // Replace with your icon URL
      case '13d': // Snow (day)
      case '13n': // Snow (night)
        return 'https://example.com/snow_icon.png'; // Replace with your icon URL
      case '50d': // Mist (day)
      case '50n': // Mist (night)
        return 'https://static.thenounproject.com/png/75094-200.png'; // Replace with your icon URL
      default:
        return ''; // Default icon URL
    }
  }
}

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({
    super.key,
    required this.iconUrl,
    required this.size,
  });

  final String iconUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iconUrl,
      width: size,
      height: size,
    );
  }
}
