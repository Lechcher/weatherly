import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/core/riverpod_weather/city_location_model.dart';
import 'package:weatherly/core/riverpod_weather/weather_provider.dart';

final locationSearchProvider = FutureProvider.autoDispose
    .family<List<CityLocationModel>, String>((ref, query) async {
      final cleanQuery = query.trim();

      if (cleanQuery.isEmpty) {
        return [];
      }

      final cancelToken = CancelToken();
      bool isDisposed = false;

      ref.onDispose(() {
        isDisposed = true;
        cancelToken.cancel('Request cancelled due to provider dispose.');
      });

      await Future.delayed(const Duration(milliseconds: 350));

      if (isDisposed) {
        return [];
      }

      final searchService = ref.watch(locationServiceProvider);
      return searchService.searchLocation(cleanQuery);
    });
