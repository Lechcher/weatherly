import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/constants/datas.dart';
import 'weather_model.dart';

final weatherListProviderWithMockData = FutureProvider<List<WeatherModel>>((
  ref,
) async {
  await Future.delayed(const Duration(seconds: 1));

  return mockWeatherList;
});
