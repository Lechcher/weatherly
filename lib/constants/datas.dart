import 'package:weatherly/core/riverpod_weather/weather_model.dart';

final List<WeatherModel> mockWeatherList = [
  // 1. HÀ NỘI
  WeatherModel(
    cityName: 'Ha Noi',
    lat: 21.0285,
    lon: 105.8542,
    currentTemp: 28.0,
    weatherCode: 61, // Rain / Showers
    apparentTemp: 29.0,
    humidity: 87,
    windSpeed: 5.0,
    uvIndex: 2.0,
    visibility: 7.0,
    pressure: 1002.0,
    usAqi: 52, // Good
    sunrise: '2026-08-18T05:37',
    sunset: '2026-08-18T18:30',
    isDay: true,
    hourlyForecast: [
      HourlyWeather(
        time: '2026-08-18T15:00',
        temp: 28.0,
        weatherCode: 61,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T16:00',
        temp: 27.0,
        weatherCode: 61,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T17:00',
        temp: 27.0,
        weatherCode: 61,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T18:00',
        temp: 27.0,
        weatherCode: 61,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T19:00',
        temp: 26.0,
        weatherCode: 3,
        isDay: false,
      ),
      HourlyWeather(
        time: '2026-08-18T20:00',
        temp: 26.0,
        weatherCode: 3,
        isDay: false,
      ),
    ],
    dailyForecast: [
      DailyWeather(
        date: '2026-08-18',
        maxTemp: 28.0,
        minTemp: 25.0,
        weatherCode: 61,
      ),
      DailyWeather(
        date: '2026-08-19',
        maxTemp: 31.0,
        minTemp: 25.0,
        weatherCode: 80,
      ),
      DailyWeather(
        date: '2026-08-20',
        maxTemp: 32.0,
        minTemp: 26.0,
        weatherCode: 80,
      ),
      DailyWeather(
        date: '2026-08-21',
        maxTemp: 34.0,
        minTemp: 27.0,
        weatherCode: 2,
      ),
      DailyWeather(
        date: '2026-08-22',
        maxTemp: 34.0,
        minTemp: 28.0,
        weatherCode: 3,
      ),
      DailyWeather(
        date: '2026-08-23',
        maxTemp: 34.0,
        minTemp: 28.0,
        weatherCode: 3,
      ),
      DailyWeather(
        date: '2026-08-24',
        maxTemp: 31.0,
        minTemp: 26.0,
        weatherCode: 2,
      ),
    ],
  ),

  // 2. TP. HỒ CHÍ MINH
  WeatherModel(
    cityName: 'Ho Chi Minh City',
    lat: 10.8231,
    lon: 106.6297,
    currentTemp: 32.0,
    weatherCode: 2, // Partly cloudy
    apparentTemp: 36.0,
    humidity: 75,
    windSpeed: 12.0,
    uvIndex: 8.0,
    visibility: 10.0,
    pressure: 1008.0,
    usAqi: 85, // Moderate
    sunrise: '2026-08-18T05:45',
    sunset: '2026-08-18T18:15',
    isDay: true,
    hourlyForecast: [
      HourlyWeather(
        time: '2026-08-18T15:00',
        temp: 32.0,
        weatherCode: 2,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T16:00',
        temp: 31.0,
        weatherCode: 2,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T17:00',
        temp: 30.0,
        weatherCode: 80,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T18:00',
        temp: 28.0,
        weatherCode: 80,
        isDay: false,
      ),
      HourlyWeather(
        time: '2026-08-18T19:00',
        temp: 27.0,
        weatherCode: 1,
        isDay: false,
      ),
    ],
    dailyForecast: [
      DailyWeather(
        date: '2026-08-18',
        maxTemp: 33.0,
        minTemp: 26.0,
        weatherCode: 2,
      ),
      DailyWeather(
        date: '2026-08-19',
        maxTemp: 32.0,
        minTemp: 25.0,
        weatherCode: 80,
      ),
      DailyWeather(
        date: '2026-08-20',
        maxTemp: 33.0,
        minTemp: 26.0,
        weatherCode: 80,
      ),
      DailyWeather(
        date: '2026-08-21',
        maxTemp: 34.0,
        minTemp: 26.0,
        weatherCode: 1,
      ),
      DailyWeather(
        date: '2026-08-22',
        maxTemp: 33.0,
        minTemp: 25.0,
        weatherCode: 2,
      ),
    ],
  ),

  // 3. ĐÀ NẴNG
  WeatherModel(
    cityName: 'Da Nang',
    lat: 16.0544,
    lon: 108.2022,
    currentTemp: 35.0,
    weatherCode: 0, // Clear sky / Sunny
    apparentTemp: 39.0,
    humidity: 62,
    windSpeed: 15.0,
    uvIndex: 10.0,
    visibility: 10.0,
    pressure: 1006.0,
    usAqi: 35, // Good
    sunrise: '2026-08-18T05:35',
    sunset: '2026-08-18T18:20',
    isDay: true,
    hourlyForecast: [
      HourlyWeather(
        time: '2026-08-18T15:00',
        temp: 35.0,
        weatherCode: 0,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T16:00',
        temp: 34.0,
        weatherCode: 0,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T17:00',
        temp: 32.0,
        weatherCode: 0,
        isDay: true,
      ),
      HourlyWeather(
        time: '2026-08-18T18:00',
        temp: 30.0,
        weatherCode: 1,
        isDay: false,
      ),
      HourlyWeather(
        time: '2026-08-18T19:00',
        temp: 29.0,
        weatherCode: 1,
        isDay: false,
      ),
    ],
    dailyForecast: [
      DailyWeather(
        date: '2026-08-18',
        maxTemp: 36.0,
        minTemp: 27.0,
        weatherCode: 0,
      ),
      DailyWeather(
        date: '2026-08-19',
        maxTemp: 35.0,
        minTemp: 27.0,
        weatherCode: 0,
      ),
      DailyWeather(
        date: '2026-08-20',
        maxTemp: 35.0,
        minTemp: 26.0,
        weatherCode: 1,
      ),
      DailyWeather(
        date: '2026-08-21',
        maxTemp: 34.0,
        minTemp: 26.0,
        weatherCode: 2,
      ),
      DailyWeather(
        date: '2026-08-22',
        maxTemp: 34.0,
        minTemp: 26.0,
        weatherCode: 2,
      ),
    ],
  ),
];
