import 'package:flutter/material.dart';

class WeatherlyAnimation extends StatefulWidget {
  final double? width;
  final double? height;
  final bool repeat;

  const WeatherlyAnimation({
    super.key,
    this.width,
    this.height,
    this.repeat = true,
  });

  @override
  State<WeatherlyAnimation> createState() => _WeatherlyAnimationState();
}

class _WeatherlyAnimationState extends State<WeatherlyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<_LetterConfig> _letter = const [
    _LetterConfig("W", Color(0xFFE89337)),
    _LetterConfig("e", Color(0xFF1ABBD9)),
    _LetterConfig("a", Color(0xFF1ABBD9)),
    _LetterConfig("t", Color(0xFF1ABBD9)),
    _LetterConfig("h", Color(0xFF1ABBD9)),
    _LetterConfig("e", Color(0xFF1ABBD9)),
    _LetterConfig("r", Color(0xFF1ABBD9)),
    _LetterConfig("l", Color(0xFF1ABBD9)),
    _LetterConfig("y", Color(0xFF1ABBD9)),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );

    if (widget.repeat) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant WeatherlyAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.repeat != oldWidget.repeat) {
      if (widget.repeat) {
        _controller.repeat(reverse: false);
      } else {
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final targetWidth = widget.width ?? 200;
    final targetHeight = widget.height ?? (targetWidth * (21.1 / 107.961));
    final targetFontSize = targetHeight * 0.85;

    return SizedBox(
      width: targetWidth,
      height: targetHeight,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: List.generate(_letter.length, (index) {
            final double startNormalized = index / _letter.length;
            final double endNormalized = (index + 1) / _letter.length;

            final Animation<double> letterAnimation = CurvedAnimation(
              parent: _controller,
              curve: Interval(
                startNormalized,
                endNormalized,
                curve: Curves.easeOutCubic,
              ),
            );

            return AnimatedBuilder(
              animation: letterAnimation,
              builder: (context, child) {
                final double value = letterAnimation.value;
                final double translateX = (1 - value) * 20;
                final double opacity = value.clamp(0, 1);

                return Opacity(
                  opacity: opacity,

                  child: Transform.translate(
                    offset: Offset(translateX, 0),
                    child: Opacity(
                      opacity: opacity,
                      child: Text(
                        _letter[index].char,
                        style: TextStyle(
                          fontSize: targetFontSize,
                          fontWeight: FontWeight.w400,
                          color: _letter[index].color,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

class _LetterConfig {
  final String char;
  final Color? color;

  const _LetterConfig(this.char, this.color);
}
