import 'package:weatherly/constants/images.dart';

String getWeatherlyIconAsset(int weatherCode, bool isDay) {
  switch (weatherCode) {
    case 0:
      return isDay ? WeatherIcons.clearSkySun : WeatherIcons.clearSkyMoon;

    case 1:
      return isDay ? WeatherIcons.rainSun : WeatherIcons.rainMoon;
    case 2:
      return isDay ? WeatherIcons.cloudsSun : WeatherIcons.cloudsMoon;
    case 3:
      return WeatherIcons.clouds;

    case 51:
    case 53:
    case 61:
    case 80:
      return isDay ? WeatherIcons.rainSun : WeatherIcons.rainMoon;

    case 63:
    case 65:
    case 81:
    case 82:
      return WeatherIcons.drizzle;

    case 71:
    case 73:
    case 75:
      return WeatherIcons.snow;

    case 95:
    case 96:
    case 99:
      return WeatherIcons.thunderstorm;

    case 45:
    case 48:
      return WeatherIcons.fog;

    default:
      return isDay ? WeatherIcons.cloudsSun : WeatherIcons.cloudsMoon;
  }
}

String getWeatherlyName(int weatherCode) {
  switch (weatherCode) {
    case 0:
      return "Clear Sky";

    case 1:
      return "Rain";

    case 2:
      return "Clouds";

    case 3:
      return "Drizzle";

    case 51:
    case 53:
    case 61:
    case 80:
      return "Rain";

    case 63:
    case 65:
    case 81:
    case 82:
      return "Drizzle";

    case 71:
    case 73:
    case 75:
      return "Snow";

    case 95:
    case 96:
    case 99:
      return "Thunderstorm";

    case 45:
    case 48:
      return "Fog";

    default:
      return "Unknown";
  }
}
