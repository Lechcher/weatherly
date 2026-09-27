import 'package:flutter/material.dart';
import 'package:weatherly/core/riverpod_weather/get_aqi_advice.dart';
import 'package:weatherly/core/riverpod_weather/get_aqi_status.dart';
import 'package:weatherly/widgets/widgets_components/aqi_progress_bar.dart';

class AirQualityCardWidget extends StatelessWidget {
  final int aqi;

  const AirQualityCardWidget({super.key, required this.aqi});

  @override
  Widget build(BuildContext context) {
    final double indicatorProgress = (aqi / 500).clamp(0, 1);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 36),
      decoration: BoxDecoration(
        color: const Color(0xFFE89337).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        spacing: 25,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Text(
            "Air quality",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),

          Column(
            children: [
              Text(
                "${getAqiStatus(aqi)} $aqi",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text(
                "${getAqiAdvice(aqi)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          AqiProgressBar(progress: indicatorProgress),
        ],
      ),
    );
  }
}
