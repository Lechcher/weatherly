class WeatherModel {
  final String cityName;
  final double lat;
  final double lon;
  final double currentTemp;
  final int weatherCode;
  final double apparentTemp;
  final int humidity;
  final double windSpeed;
  final double uvIndex;
  final double visibility;
  final double pressure;
  final int usAqi;
  final String sunrise;
  final String sunset;
  final bool isDay;
  final List<HourlyWeather> hourlyForecast;
  final List<DailyWeather> dailyForecast;

  WeatherModel({
    required this.cityName,
    required this.lat,
    required this.lon,
    required this.currentTemp,
    required this.weatherCode,
    required this.apparentTemp,
    required this.humidity,
    required this.windSpeed,
    required this.uvIndex,
    required this.visibility,
    required this.pressure,
    required this.usAqi,
    required this.sunrise,
    required this.sunset,
    required this.isDay,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory WeatherModel.fromApiResponse({
    required String cityName,
    required double lat,
    required double lon,
    required Map<String, dynamic> weatherJson,
    required Map<String, dynamic> aqiJson,
  }) {
    final current = weatherJson['current'];
    final daily = weatherJson['daily'];
    final hourly = weatherJson['hourly'];

    final List<dynamic> aqiHourlyList =
        aqiJson['hourly']?['us_aqi_pm2_5'] ?? [];
    final int currentAqi = aqiHourlyList.isNotEmpty && aqiHourlyList[0] != null
        ? (aqiHourlyList[0] as num).toInt()
        : 0;

    List<HourlyWeather> hourlyList = [];
    if (hourly != null) {
      List<String> times = List<String>.from(hourly['time'] ?? []);
      List<dynamic> temps = hourly['temperature_2m'] ?? [];
      List<dynamic> codes = hourly['weather_code'] ?? [];
      List<dynamic> isDaysList = hourly['is_day'] ?? [];

      for (int i = 0; i < times.length && i < 24; i++) {
        hourlyList.add(
          HourlyWeather(
            time: times[i],
            temp: (temps[i] as num).toDouble(),
            weatherCode: (codes[i] as num).toInt(),
            isDay: isDaysList.isNotEmpty
                ? (isDaysList[i] as num).toInt() == 1
                : true,
          ),
        );
      }
    }

    List<DailyWeather> dailyList = [];
    if (daily != null) {
      List<String> dates = List<String>.from(daily['time'] ?? []);
      List<dynamic> maxTemps = daily['temperature_2m_max'] ?? [];
      List<dynamic> minTemps = daily['temperature_2m_min'] ?? [];
      List<dynamic> codes = daily['weather_code'] ?? [];

      for (int i = 0; i < dates.length; i++) {
        dailyList.add(
          DailyWeather(
            date: dates[i],
            maxTemp: (maxTemps[i] as num).toDouble(),
            minTemp: (minTemps[i] as num).toDouble(),
            weatherCode: (codes[i] as num).toInt(),
          ),
        );
      }
    }

    return WeatherModel(
      cityName: cityName,
      lat: lat,
      lon: lon,
      currentTemp: (current['temperature_2m'] as num).toDouble(),
      weatherCode: (current['weather_code'] as num).toInt(),
      apparentTemp: (current['apparent_temperature'] as num).toDouble(),
      humidity: (current['relative_humidity_2m'] as num).toInt(),
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
      uvIndex: (current['uv_index'] as num).toDouble(),
      visibility: ((current['visibility'] as num).toDouble()) / 1000, // m -> km
      pressure: (current['surface_pressure'] as num).toDouble(),
      usAqi: currentAqi,
      sunrise: daily['sunrise']?[0] ?? '',
      sunset: daily['sunset']?[0] ?? '',
      isDay: (current['is_day'] as num).toInt() == 1,
      hourlyForecast: hourlyList,
      dailyForecast: dailyList,
    );
  }
}

class HourlyWeather {
  final String time;
  final double temp;
  final int weatherCode;
  final bool isDay;

  HourlyWeather({
    required this.time,
    required this.temp,
    required this.weatherCode,
    required this.isDay,
  });
}

class DailyWeather {
  final String date;
  final double maxTemp;
  final double minTemp;
  final int weatherCode;

  DailyWeather({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCode,
  });
}
