import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:weatherly/constants/icons.dart';
import 'package:weatherly/core/riverpod_weather/get_aqi_status.dart';
import 'package:weatherly/core/riverpod_weather/map_weather_code.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';

class CityCardItem extends StatelessWidget {
  final WeatherModel weather;
  final bool isCurrentLocation;
  final bool isEditMode;
  final bool isSelected;
  final VoidCallback? onSelectToggle;

  const CityCardItem({
    super.key,
    required this.weather,
    required this.isCurrentLocation,
    required this.isEditMode,
    required this.isSelected,
    this.onSelectToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFBB873),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF004E5C), width: 2),
      ),
      child: Row(
        children: [
          if (isEditMode && !isCurrentLocation) ...[
            VectorGraphic(
              loader: AssetBytesLoader(UtilityIcons.chevronsDownUp),
              colorFilter: const ColorFilter.mode(
                Color(0xFF0F172A),
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
          ],

          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          weather.cityName,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        if (isCurrentLocation) ...[
                          const SizedBox(width: 8),
                          VectorGraphic(
                            loader: AssetBytesLoader(UtilityIcons.location2),
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF0F172A),
                              BlendMode.srcIn,
                            ),
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ],
                    ),

                    if (isEditMode)
                      GestureDetector(
                        onTap: onSelectToggle,
                        child: VectorGraphic(
                          loader: AssetBytesLoader(
                            isSelected
                                ? UtilityIcons.selectChecked
                                : UtilityIcons.select,
                          ),
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF0F172A),
                            BlendMode.srcIn,
                          ),
                          width: 24,
                          height: 24,
                        ),
                      )
                    else
                      Text(
                        "${weather.currentTemp.toInt()} °",
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Air quality: ${weather.usAqi} - ${getAqiStatus(weather.usAqi)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0F172A),
                      ),
                    ),

                    if (!isEditMode)
                      Text(
                        getWeatherlyName(weather.weatherCode),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
