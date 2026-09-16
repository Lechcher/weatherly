import 'package:flutter/material.dart';
import 'package:weatherly/widgets/widgets_components/weatherly_animation.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isRefreshingOverlay;

  const LoadingOverlay({super.key, this.isRefreshingOverlay = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: isRefreshingOverlay ? 1 : 0,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffe0f2fe),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [WeatherlyAnimation(width: 220, height: 60, repeat: true)],
        ),
      ),
    );
  }
}
