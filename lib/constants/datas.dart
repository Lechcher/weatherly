import 'package:weatherly/core/riverpod_weather/weather_model.dart';
import 'package:weatherly/core/riverpod_weather/city_location_model.dart';

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

final List<CityLocationModel> topLocalCities = [
  CityLocationModel(
    id: "21.0285_105.8542",
    name: "Current",
    country: "Vietnam",
    lat: 21.0285,
    lon: 105.8542,
  ),
  CityLocationModel(
    id: "10.0371_105.7828",
    name: "Can Tho",
    country: "Vietnam",
    lat: 10.0371,
    lon: 105.7828,
  ),
  CityLocationModel(
    id: "16.0544_108.2022",
    name: "Da Nang",
    country: "Vietnam",
    lat: 16.0544,
    lon: 108.2022,
  ),
  CityLocationModel(
    id: "20.8449_106.6881",
    name: "Hai Phong",
    country: "Vietnam",
    lat: 20.8449,
    lon: 106.6881,
  ),
  CityLocationModel(
    id: "21.0285_105.8542_hanoi",
    name: "Ha Noi",
    country: "Vietnam",
    lat: 21.0285,
    lon: 105.8542,
  ),
  CityLocationModel(
    id: "10.8231_106.6297",
    name: "Ho Chi Minh City",
    country: "Vietnam",
    lat: 10.8231,
    lon: 106.6297,
  ),
  CityLocationModel(
    id: "12.2388_109.1967",
    name: "Nha Trang",
    country: "Vietnam",
    lat: 12.2388,
    lon: 109.1967,
  ),
];

final List<CityLocationModel> topWorldCities = [
  CityLocationModel(
    id: "40.7128_-74.0060",
    name: "New York",
    country: "United States",
    lat: 40.7128,
    lon: -74.0060,
  ),
  CityLocationModel(
    id: "48.8566_2.3522",
    name: "Paris",
    country: "France",
    lat: 48.8566,
    lon: 2.3522,
  ),
  CityLocationModel(
    id: "51.5074_-0.1278",
    name: "London",
    country: "United Kingdom",
    lat: 51.5074,
    lon: -0.1278,
  ),
  CityLocationModel(
    id: "41.9028_12.4964",
    name: "Rome",
    country: "Italy",
    lat: 41.9028,
    lon: 12.4964,
  ),
  CityLocationModel(
    id: "25.2048_55.2708",
    name: "Dubai",
    country: "United Arab Emirates",
    lat: 25.2048,
    lon: 55.2708,
  ),
  CityLocationModel(
    id: "55.7558_37.6173",
    name: "Moscow",
    country: "Russia",
    lat: 55.7558,
    lon: 37.6173,
  ),
  CityLocationModel(
    id: "-33.8688_151.2093",
    name: "Sydney",
    country: "Australia",
    lat: -33.8688,
    lon: 151.2093,
  ),
  CityLocationModel(
    id: "1.3521_103.8198",
    name: "Singapore",
    country: "Singapore",
    lat: 1.3521,
    lon: 103.8198,
  ),
  CityLocationModel(
    id: "39.9042_116.4074",
    name: "Beijing",
    country: "China",
    lat: 39.9042,
    lon: 116.4074,
  ),
  CityLocationModel(
    id: "37.9838_23.7275",
    name: "Athens",
    country: "Greece",
    lat: 37.9838,
    lon: 23.7275,
  ),
];

final List<CityLocationModel> searchResultsNewYork = [
  CityLocationModel(
    id: "40.7128_-74.0060_ny",
    name: "New York",
    country: "United States",
    lat: 40.7128,
    lon: -74.0060,
  ),
  CityLocationModel(
    id: "43.0906_-75.2913",
    name: "New York Mills, New York",
    country: "United States",
    lat: 43.0906,
    lon: -75.2913,
  ),
  CityLocationModel(
    id: "46.5180_-95.3761",
    name: "New York Mills, Minnesota",
    country: "United States",
    lat: 46.5180,
    lon: -95.3761,
  ),
  CityLocationModel(
    id: "40.7857_-74.0104",
    name: "West New York",
    country: "United States",
    lat: 40.7857,
    lon: -74.0104,
  ),
];
