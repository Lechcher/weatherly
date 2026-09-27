import 'package:flutter/material.dart';
import 'package:weatherly/core/riverpod_weather/format_daily_date.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';
import 'package:weatherly/utils/daily_forecast_card_utils.dart';

class DailyForecastCardWidget extends StatelessWidget {
  final WeatherModel weather;

  const DailyForecastCardWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final displayDailyItems = prepareDailyDisplayItems(weather);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE89337).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        spacing: 25,

        children: [
          Text(
            "Weather Forecast",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),

          Column(
            children: List.generate(displayDailyItems.length, (index) {
              final item = displayDailyItems[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            formatDailyDate(item.date, index),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 3,
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Image(
                            image: AssetImage(item.iconAsset),
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                            excludeFromSemantics: true,
                          ),

                          Expanded(
                            child: Text(
                              item.weatherDescription,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Text(
                        "${item.maxTemp.toInt()}°/${item.minTemp.toInt()}°",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
