import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/constants/icons.dart';
import 'package:weatherly/core/responsive_svg/responsive_svg.dart';
import 'package:weatherly/widgets/widgets_components/dot.dart';

class CityPageIndicator extends ConsumerWidget {
  final int itemCount;
  final int currentIndex;

  const CityPageIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (itemCount <= 0) return const SizedBox.shrink();

    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: List.generate(itemCount, (index) {
        if (index == currentIndex) {
          return ResponsiveSvg(assetPath: UtilityIcons.location2, size: 22);
        } else {
          return const Dot();
        }
      }),
    );
  }
}
