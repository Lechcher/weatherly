import 'package:flutter/material.dart';
import 'package:weatherly/constants/images.dart';
import 'package:weatherly/core/riverpod_weather/format_time.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';
import 'package:weatherly/utils/sun_cycle_card_utils.dart';

class SunCycleCardWidget extends StatelessWidget {
  final WeatherModel weather;

  const SunCycleCardWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final progress = calculateSunCycleProgress(weather);
    final isDay = weather.isDay;

    final startLabel = isDay ? 'Sunrise' : 'Sunset';
    final endLabel = isDay ? 'Sunset' : 'Sunrise';
    final startTime = isDay
        ? formatTime(weather.sunrise, formatWidgetType.sun_cycle_card_widget)
        : formatTime(weather.sunset, formatWidgetType.sun_cycle_card_widget);
    final endTime = isDay
        ? formatTime(weather.sunset, formatWidgetType.sun_cycle_card_widget)
        : formatTime(weather.sunrise, formatWidgetType.sun_cycle_card_widget);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only( bottom: 25, left: 25, right: 25),
      decoration: BoxDecoration(
        color: const Color(0xFFE89337).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  WeatherIconsSmall.sunrise,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  WeatherIconsSmall.sunset,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 110,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;

                final t = progress;
                final p0 = Offset(0, height);
                final p1 = Offset(width / 2, -height * 0.4);
                final p2 = Offset(width, height);

                final x =
                    (1 - t) * (1 - t) * p0.dx +
                    2 * (1 - t) * t * p1.dx +
                    t * t * p2.dx;
                final y =
                    (1 - t) * (1 - t) * p0.dy +
                    2 * (1 - t) * t * p1.dy +
                    t * t * p2.dy;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomPaint(
                      size: Size(width, height),
                      painter: SunArcPainter(isDay: isDay),
                    ),
                    Positioned(
                      left: x - 16,
                      top: y - 16,
                      child: Image.asset(
                        isDay
                            ? WeatherIconsSmall.clearSkySun
                            : WeatherIconsSmall.clearSkyMoon,
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    startLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    startTime,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    endLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    endTime,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
