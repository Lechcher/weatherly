import 'package:flutter/material.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';

double calculateSunCycleProgress(WeatherModel weather) {
  try {
    final now = DateTime.now();
    final sunriseTime = DateTime.parse(weather.sunrise);
    final sunsetTime = DateTime.parse(weather.sunset);

    if (weather.isDay) {
      final totalDuration = sunsetTime.difference(sunriseTime).inMinutes;

      if (totalDuration <= 0) return 0.5;

      final elapsedDuration = now.difference(sunriseTime).inMinutes;

      return (elapsedDuration / totalDuration).clamp(0.0, 1.0);
    } else {
      var nextSunrise = sunriseTime;
      if (now.isAfter(sunsetTime)) {
        nextSunrise = sunriseTime.add(const Duration(days: 1));
      }

      final totalDuration = nextSunrise.difference(sunsetTime).inMinutes;

      if (totalDuration <= 0) return 0.5;

      final elapsedDuration = now.difference(sunsetTime).inMinutes;

      return (elapsedDuration / totalDuration).clamp(0.0, 1.0);
    }
  } catch (e) {
    return 0.5;
  }
}

class SunArcPainter extends CustomPainter {
  final bool isDay;

  SunArcPainter({required this.isDay});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path();
    path.moveTo(0, height);
    path.quadraticBezierTo(width / 2, -height * 0.4, width, height);

    final fillPath = Path.from(path)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1ABBD9).withValues(alpha: 0.5),
          const Color(0xFF1ABBD9).withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    canvas.drawPath(fillPath, fillPaint);

    final strokePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0F172A).withValues(alpha: 1),
          const Color(0xFF0F172A).withValues(alpha: 0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(fillPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant SunArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(covariant SunArcPainter oldDelegate) => false;
}
