import 'package:dio/dio.dart';
import 'package:weatherly/core/riverpod_weather/city_location_model.dart';

class PhotonAutocompleteLocationSearchService {
  final Dio _dio;

  PhotonAutocompleteLocationSearchService(this._dio);

  Future<List<CityLocationModel>> searchLocation(String query) async {
    final cleanQuery = query.trim();

    if (cleanQuery.isEmpty) {
      return [];
    }

    try {
      final response = await _dio.get(
        'https://photon.komoot.io/api/',
        queryParameters: {"q": cleanQuery, "limit": 10, "lang": "en"},
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic>? features = response.data['features'];
        if (features == null) return [];

        return features
            .map((feature) {
              try {
                return CityLocationModel.fromPhotonFeature(
                  feature as Map<String, dynamic>,
                );
              } catch (_) {
                return null;
              }
            })
            .whereType<CityLocationModel>() // Lọc bỏ các item parse lỗi nếu có
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
