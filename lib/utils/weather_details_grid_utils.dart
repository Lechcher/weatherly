import 'package:weatherly/constants/images.dart';
import 'package:weatherly/core/riverpod_weather/get_uv_status.dart';
import 'package:weatherly/core/riverpod_weather/map_weather_code.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';

class _WeatherDetailsData {
  final String iconAsset;
  final String title;
  final String value;
  final String unit;

  _WeatherDetailsData({
    required this.iconAsset,
    required this.title,
    required this.value,
    required this.unit,
  });
}

List<_WeatherDetailsData> weatherDetailsData(WeatherModel weather) {
  return [
    _WeatherDetailsData(
      iconAsset: WeatherDetailIcons.temperature,
      title: 'Feels like',
      value: '${weather.apparentTemp.toInt()}',
      unit: '°',
    ),
    _WeatherDetailsData(
      iconAsset: WeatherDetailIcons.wind,
      title: 'NW wind',
      value: '${weather.windSpeed.toInt()}',
      unit: 'km/h',
    ),
    _WeatherDetailsData(
      iconAsset: WeatherDetailIcons.humidity,
      title: 'Humidity',
      value: '${weather.humidity.toInt()}',
      unit: '%',
    ),
    _WeatherDetailsData(
      iconAsset: getWeatherlyIconAsset(0, true, true),
      title: 'UV',
      value: '${weather.uvIndex.toInt()}',
      unit: getUvStatus(weather.uvIndex.toDouble()),
    ),
    _WeatherDetailsData(
      iconAsset: WeatherDetailIcons.vision,
      title: 'Visibility',
      value: '${weather.visibility.toInt()}',
      unit: 'km',
    ),
    _WeatherDetailsData(
      iconAsset: WeatherDetailIcons.airPressure,
      title: 'Pressure',
      value: '${weather.pressure.toInt()}',
      unit: 'hPa',
    ),
  ];
}
