import 'package:weatherly/core/riverpod_weather/map_weather_code.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';

class DailyForecastItem {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String iconAsset;
  final String weatherDescription;

  DailyForecastItem({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.iconAsset,
    required this.weatherDescription,
  });
}

List<DailyForecastItem> prepareDailyDisplayItems(WeatherModel weather) {
  final List<DailyForecastItem> items = [];

  for (int index = 0; index < weather.dailyForecast.length; index++) {
    final daily = weather.dailyForecast[index];

    items.add(
      DailyForecastItem(
        date: daily.date,
        maxTemp: daily.maxTemp,
        minTemp: daily.minTemp,
        iconAsset: getWeatherlyIconAsset(daily.weatherCode, true, true),
        weatherDescription: getWeatherlyName(daily.weatherCode),
      ),
    );
  }

  return items.toList();
}
