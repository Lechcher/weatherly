import 'package:flutter/material.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';
import 'package:weatherly/utils/weather_details_grid_utils.dart';

class WeatherDetailsGridWidget extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDetailsGridWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: const Color(0xFFE89337).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          const Text(
            "Weather details",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: weatherDetailsData(weather).length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 28,
              childAspectRatio: 1.3,
            ),
            itemBuilder: ((context, index) {
              final item = weatherDetailsData(weather)[index];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image(
                    image: AssetImage(item.iconAsset),
                    width: 24,
                    height: 24,
                  ),

                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    spacing: 4,

                    children: [
                      Text(
                        "${item.value}",
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        item.unit,
                        style: TextStyle(
                          fontSize:
                              item.title.isNotEmpty &&
                                  item.title.trim() == 'Feels like'
                              ? 36
                              : 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
