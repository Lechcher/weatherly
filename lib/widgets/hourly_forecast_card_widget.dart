import 'package:flutter/material.dart';
import 'package:weatherly/core/riverpod_weather/format_time.dart';
import 'package:weatherly/core/riverpod_weather/get_aqi_status.dart';
import 'package:weatherly/core/riverpod_weather/get_weekday.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';
import 'package:weatherly/utils/hourly_forecast_card_utils.dart';

class HourlyForecastCardWidget extends StatelessWidget {
  final WeatherModel weather;

  const HourlyForecastCardWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final displayItems = prepareHourlyDisplayItems(weather);

    final todayForecast = weather.dailyForecast.isNotEmpty
        ? weather.dailyForecast.first
        : null;

    final usAqi = weather.usAqi.toInt();

    final maxTemp = todayForecast?.maxTemp.toInt() ?? 0;
    final minTemp = todayForecast?.minTemp.toInt() ?? 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFE89337).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${getWeekday(DateTime.now())} $maxTemp°/$minTemp°",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Air quality: ${usAqi} - ${getAqiStatus(usAqi)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: List.generate(displayItems.length, (index) {
                final item = displayItems[index];

                return Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      formatTime(item.time, index),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image(
                      image: AssetImage(item.iconAsset),
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                      excludeFromSemantics: true,
                    ),
                    Text(
                      "${item.tempText}°",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
