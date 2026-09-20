import 'package:flutter/material.dart';
import 'package:weatherly/constants/icons.dart';
import 'package:weatherly/core/responsive_svg/responsive_svg.dart';
import 'package:weatherly/core/riverpod_weather/map_weather_code.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';
import 'package:weatherly/widgets/widgets_components/city_page_indicator.dart';

class CurrentWeatherHeaderWidget extends StatelessWidget {
  final WeatherModel weather;

  final PageController pageController;
  final int index;
  final int totalCities;
  final int currentIndex;

  const CurrentWeatherHeaderWidget({
    super.key,
    required this.weather,
    required this.pageController,
    required this.index,
    required this.totalCities,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,

      children: [
        Image(
          image: AssetImage(
            getWeatherlyIconAsset(weather.weatherCode, weather.isDay),
          ),
          width: 256,
          height: 256,
          fit: BoxFit.contain,
        ),

        Column(
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  weather.currentTemp.toString(),
                  style: TextStyle(fontSize: 72),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    ClipOval(
                      child: ResponsiveSvg(
                        assetPath: UtilityIcons.degree,
                        size: 10,
                      ),
                    ),

                    Text(
                      getWeatherlyName(weather.weatherCode),
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              spacing: 10,
              children: [
                Text(weather.cityName, style: TextStyle(fontSize: 36)),
                AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    final double page =
                        pageController.hasClients &&
                            pageController.position.haveDimensions
                        ? (pageController.page ?? index.toDouble())
                        : index.toDouble();

                    final double screenWidth = MediaQuery.of(
                      context,
                    ).size.width;

                    final double dx = (page - index) * screenWidth;

                    return Transform.translate(
                      offset: Offset(dx, 0),
                      child: child,
                    );
                  },

                  child: CityPageIndicator(
                    itemCount: totalCities,
                    currentIndex: currentIndex,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
