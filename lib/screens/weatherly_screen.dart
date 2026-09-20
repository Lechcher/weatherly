import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/constants/icons.dart';
import 'package:weatherly/core/responsive_svg/responsive_svg.dart';
import 'package:weatherly/core/riverpod_weather/current_page_index_notifier.dart';
import 'package:weatherly/core/riverpod_weather/weather_provider.dart';
import 'package:weatherly/widgets/air_quality_card_widget.dart';
import 'package:weatherly/widgets/current_weather_header_widget.dart';
import 'package:weatherly/widgets/daily_forecast_card_widget.dart';
import 'package:weatherly/widgets/hourly_forecast_card_widget.dart';
import 'package:weatherly/widgets/sun_cycle_card_widget.dart';
import 'package:weatherly/widgets/weather_details_grid_widget.dart';
import 'package:weatherly/widgets/loading_overlay.dart';
import 'package:weatherly/widgets/widgets_components/weather_sliver_app_bar.dart';

final currentPageIndexProvider =
    NotifierProvider<CurrentPageIndexNotifier, int>(
      CurrentPageIndexNotifier.new,
    );

class IsRefreshingOverlayNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setRefreshing(bool value) {
    state = value;
  }
}

final isRefreshingOverlayProvider =
    NotifierProvider<IsRefreshingOverlayNotifier, bool>(
      IsRefreshingOverlayNotifier.new,
    );

class WeatherlyScreen extends ConsumerStatefulWidget {
  const WeatherlyScreen({super.key});

  @override
  ConsumerState<WeatherlyScreen> createState() => _WeatherlyScreenState();
}

class _WeatherlyScreenState extends ConsumerState<WeatherlyScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherAsync = ref.watch(weatherListProvider);
    final currentIndex = ref.watch(currentPageIndexProvider);
    final isRefreshingOverlay = ref.watch(isRefreshingOverlayProvider);

    return Scaffold(
      backgroundColor: const Color(0xffe0f2fe),
      body: Stack(
        children: [
          weatherAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text("Error: $error")),
            data: (citiesWeather) {
              if (citiesWeather.isEmpty) {
                return const SizedBox.shrink();
              }

              final currentCity = citiesWeather[currentIndex];

              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    WeatherSliverAppBar(
                      cityName: currentCity.cityName,
                      backgroundColor: const Color(0xffe0f2fe),
                      onLocationPressed: () {},
                      onSettingPressed: () {},
                    ),
                  ];
                },
                body: PageView.builder(
                  controller: _pageController,
                  itemCount: citiesWeather.length,
                  onPageChanged: (index) {
                    ref
                        .read(currentPageIndexProvider.notifier)
                        .updatePageIndex(index);
                  },
                  itemBuilder: (context, index) {
                    final weather = citiesWeather[index];

                    return EasyRefresh(
                      header: BuilderHeader(
                        triggerOffset: 70,
                        clamping: false,
                        processedDuration: Duration.zero,
                        position: IndicatorPosition.above,
                        builder: (context, state) {
                          if (isRefreshingOverlay ||
                              state.mode == IndicatorMode.processing ||
                              state.mode == IndicatorMode.ready ||
                              state.mode == IndicatorMode.processed) {
                            return const SizedBox.shrink();
                          }

                          if (state.offset <= 0) {
                            return const SizedBox.shrink();
                          }

                          final double progress = (state.offset / 70).clamp(
                            0,
                            1,
                          );

                          final double angle = progress * math.pi;

                          return SafeArea(
                            top: false,
                            bottom: false,

                            child: Container(
                              width: double.infinity,
                              height: state.offset,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 10),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Transform.rotate(
                                    angle: angle,
                                    child: ResponsiveSvg(
                                      assetPath: UtilityIcons.circleArrowDown,
                                      size: 20,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFF0F172A),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  Text(
                                    state.mode == IndicatorMode.armed
                                        ? "Release to refresh"
                                        : "Pull to refresh",
                                    style: const TextStyle(
                                      color: Color(0xFF0F172A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      onRefresh: () async {
                        ref
                            .read(isRefreshingOverlayProvider.notifier)
                            .setRefreshing(true);

                        try {
                          final _ = await ref.refresh(
                            weatherListProvider.future,
                          );
                        } finally {
                          await Future.delayed(const Duration(seconds: 1));

                          ref
                              .read(isRefreshingOverlayProvider.notifier)
                              .setRefreshing(false);

                          await Future.delayed(const Duration(seconds: 1));
                        }
                      },

                      child: CustomScrollView(
                        key: PageStorageKey(weather.cityName),
                        slivers: [
                          SliverToBoxAdapter(
                            child: SafeArea(
                              top: false,

                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),

                                child: Column(
                                  spacing: 30,
                                  children: [
                                    SizedBox(height: 25),
                                    CurrentWeatherHeaderWidget(
                                      cityName: weather.cityName,
                                      temperature: weather.currentTemp.toInt(),
                                      weatherCode: weather.weatherCode,
                                      isDay: weather.isDay,
                                      pageController: _pageController,
                                      index: index,
                                      totalCities: citiesWeather.length,
                                      currentIndex: currentIndex,
                                    ),

                                    HourlyForecastCardWidget(weather: weather),
                                    DailyForecastCardWidget(),
                                    AirQualityCardWidget(),
                                    WeatherDetailsGridWidget(),
                                    SunCycleCardWidget(),
                                    const SizedBox(height: 30),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),

          IgnorePointer(
            ignoring: !isRefreshingOverlay,
            child: LoadingOverlay(isRefreshingOverlay: isRefreshingOverlay),
          ),
        ],
      ),
    );
  }
}
