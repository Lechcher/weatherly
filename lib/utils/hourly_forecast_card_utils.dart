import 'package:weatherly/constants/images.dart';
import 'package:weatherly/core/riverpod_weather/map_weather_code.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';

class HourlyDisplayItem {
  final String time;
  final String tempText;
  final String iconAsset;
  final bool isSunEvent;

  HourlyDisplayItem({
    required this.time,
    required this.tempText,
    required this.iconAsset,
    this.isSunEvent = false,
  });
}

String _extractHourMinute(String isoTime) {
  if (isoTime.isEmpty) return '';

  try {
    final dateTime = DateTime.parse(isoTime);
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  } catch (_) {
    return '';
  }
}

List<HourlyDisplayItem> prepareHourlyDisplayItems(WeatherModel weather) {
  final List<HourlyDisplayItem> items = [];

  final String sunriseTime = _extractHourMinute(weather.sunrise);
  final String sunsetTime = _extractHourMinute(weather.sunset);

  for (int index = 0; index < weather.hourlyForecast.length; index++) {
    final hourly = weather.hourlyForecast[index];
    final String itemTime = _extractHourMinute(hourly.time);

    if (sunriseTime.isNotEmpty && itemTime == sunriseTime) {
      items.add(
        HourlyDisplayItem(
          time: itemTime,
          tempText: hourly.temp.toStringAsFixed(0),
          iconAsset: WeatherIcons.sunrise,
          isSunEvent: true,
        ),
      );
    } else if (sunsetTime.isNotEmpty && itemTime == sunsetTime) {
      items.add(
        HourlyDisplayItem(
          time: itemTime,
          tempText: hourly.temp.toStringAsFixed(0),
          iconAsset: WeatherIcons.sunset,
          isSunEvent: true,
        ),
      );
    }

    items.add(
      HourlyDisplayItem(
        time: hourly.time,
        tempText: "${hourly.temp.toInt()}",
        iconAsset: getWeatherlyIconAsset(hourly.weatherCode, hourly.isDay),
      ),
    );
  }

  return items.take(5).toList();
}
