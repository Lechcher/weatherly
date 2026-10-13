import 'package:flutter/material.dart';

class WeatherlyText extends StatelessWidget {
  const WeatherlyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'W',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFFE89337),
          ),
        ),
        Text(
          'eatherly',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1ABBD9),
          ),
        ),
      ],
    );
  }
}
