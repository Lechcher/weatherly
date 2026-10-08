import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/core/riverpod_weather/city_location_model.dart';
import 'package:weatherly/core/riverpod_weather/weather_model.dart';
import 'package:weatherly/services/photon_autocomplete_location_search_service.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  return dio;
});

final locationServiceProvider =
    Provider<PhotonAutocompleteLocationSearchService>(
      (ref) => PhotonAutocompleteLocationSearchService(ref.watch(dioProvider)),
    );

class SavedCitiesNotifier extends Notifier<List<CityLocationModel>> {
  @override
  List<CityLocationModel> build() {
    return [];
  }

  void addCity(CityLocationModel city) {
    if (!state.any((element) => element.id == city.id)) {
      state = [...state, city];
    }
  }

  void removeCity(String id) {
    state = state.where((city) => city.id != id).toList();
  }
}

final savedCitiesProvider =
    NotifierProvider<SavedCitiesNotifier, List<CityLocationModel>>(
      SavedCitiesNotifier.new,
    );

final weatherListProvider = FutureProvider<List<WeatherModel>>((ref) async {
  final dio = ref.watch(dioProvider);
  final List<CityLocationModel> cities = ref.watch(savedCitiesProvider);

  if (cities.isEmpty) {
    return [];
  }

  final futures = cities.map((city) async {
    try {
      final weatherFuture = dio.get(
        'https://api.open-meteo.com/v1/forecast',
        queryParameters: {
          'latitude': city.lat,
          'longitude': city.lon,
          'current':
              'temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,surface_pressure,wind_speed_10m,uv_index,visibility,is_day',
          'hourly': 'temperature_2m,weather_code,is_day',
          'daily':
              'weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset',
          'forecast_days': 7,
          'timezone': 'auto',
        },
      );

      final aqiFuture = dio.get(
        'https://air-quality-api.open-meteo.com/v1/air-quality',
        queryParameters: {
          'latitude': city.lat,
          'longitude': city.lon,
          'hourly': 'us_aqi_pm2_5',
          'forecast_days': 1,
        },
      );

      final result = await Future.wait([weatherFuture, aqiFuture]);

      return WeatherModel.fromApiResponse(
        cityName: city.name,
        lat: city.lat,
        lon: city.lon,
        weatherJson: result[0].data,
        aqiJson: result[1].data,
      );
    } catch (e) {
      rethrow;
    }
  }).toList();

  return await Future.wait(futures);
});
