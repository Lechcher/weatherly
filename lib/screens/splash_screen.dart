import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherly/core/riverpod_weather/weather_provider.dart';
import 'package:weatherly/widgets/widgets_components/weatherly_animation.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    FlutterNativeSplash.remove();

    await Future.wait([
      ref.read(weatherListProvider.future),
      Future.delayed(const Duration(milliseconds: 2500)),
    ]);

    if (!mounted) return;

    context.go('/weatherly');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0f2fe),
      body: Center(child: WeatherlyAnimation(width: 240, repeat: false)),
    );
  }
}
