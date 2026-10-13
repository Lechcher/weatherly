import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';
import 'package:weatherly/constants/icons.dart';

class WeatherlySliverAppBar extends StatelessWidget {
  final String cityName;
  final Color backgroundColor;
  final VoidCallback onLocationPressed;
  final VoidCallback onSettingPressed;

  const WeatherlySliverAppBar({
    super.key,
    required this.cityName,
    required this.backgroundColor,
    required this.onLocationPressed,
    required this.onSettingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _WeatherlySliverAppBarDelegate(
        cityName: cityName,
        backgroundColor: backgroundColor,
        onLocationPressed: onLocationPressed,
        onSettingPressed: onSettingPressed,
        statusBarHeight: MediaQuery.of(context).padding.top,
      ),
    );
  }
}

class _WeatherlySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String cityName;
  final Color backgroundColor;
  final VoidCallback onLocationPressed;
  final VoidCallback onSettingPressed;
  final double statusBarHeight;

  _WeatherlySliverAppBarDelegate({
    required this.cityName,
    this.backgroundColor = Colors.transparent,
    required this.onLocationPressed,
    required this.onSettingPressed,
    required this.statusBarHeight,
  });

  @override
  double get maxExtent => kToolbarHeight + statusBarHeight;

  @override
  double get minExtent => kToolbarHeight + statusBarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final bool isScrolled = shrinkOffset > 10 || overlapsContent;
    final double progress = isScrolled ? 1 : 0;

    return Material(
      color: backgroundColor,
      elevation: 0,

      child: SafeArea(
        bottom: false,

        child: Stack(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: progress,

                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 250),
                          offset: progress == 1
                              ? Offset.zero
                              : Offset(0.0, 0.3),

                          child: Text(
                            cityName,
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      icon: VectorGraphic(
                        loader: AssetBytesLoader(UtilityIcons.location2),
                        width: 24,
                        height: 24,
                      ),
                      onPressed: onLocationPressed,
                    ),
                    IconButton(
                      icon: VectorGraphic(
                        loader: AssetBytesLoader(UtilityIcons.settings),
                        width: 24,
                        height: 24,
                      ),
                      onPressed: onSettingPressed,
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,

              child: AnimatedFractionallySizedBox(
                duration: const Duration(milliseconds: 300),
                widthFactor: progress,
                alignment: Alignment.centerLeft,

                child: Container(height: 1, color: Color(0xFF0F172A)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _WeatherlySliverAppBarDelegate oldDelegate) {
    return cityName != oldDelegate.cityName ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}
