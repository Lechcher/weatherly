import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/constants/datas.dart';
import 'weather_model.dart';

// Provider giả lập trả về danh sách Mock Data
final weatherListProvider = FutureProvider<List<WeatherModel>>((ref) async {
  // Giả lập độ trễ mạng 1 giây để test hiệu ứng Loading Indicator trên UI
  await Future.delayed(const Duration(seconds: 1));

  return mockWeatherList;
});
