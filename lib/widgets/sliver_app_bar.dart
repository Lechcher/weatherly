import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';
import 'package:weatherly/constants/icons.dart';

class HeaderSliverAppBarAction {
  final String iconAsset;
  final VoidCallback onTap;

  HeaderSliverAppBarAction(this.iconAsset, this.onTap);
}

class HeaderSliverAppBar extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final HeaderSliverAppBarAction? actionButton;

  const HeaderSliverAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _HeaderSliverAppBarDelegate(
        title: title,
        backgroundColor: backgroundColor,
        statusBarHeight: MediaQuery.of(context).padding.top,
        actionButton: actionButton,
      ),
    );
  }
}

class _HeaderSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Color backgroundColor;
  final double statusBarHeight;
  final HeaderSliverAppBarAction? actionButton;

  _HeaderSliverAppBarDelegate({
    required this.statusBarHeight,
    this.backgroundColor = Colors.transparent,
    required this.title,
    this.actionButton,
  });

  @override
  double get maxExtent => kToolbarHeight + statusBarHeight;

  @override
  double get minExtent => kToolbarHeight + statusBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      IconButton(
                        icon: VectorGraphic(
                          loader: AssetBytesLoader(UtilityIcons.chevronLeft),
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          if (context.canPop()) {
                            context.pop();
                          }
                        },
                      ),

                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  if (actionButton != null)
                    IconButton(
                      onPressed: actionButton!.onTap,
                      icon: VectorGraphic(
                        loader: AssetBytesLoader(actionButton!.iconAsset),
                        width: 24,
                        height: 24,
                      ),
                    )
                  else
                    const SizedBox(width: 48),
                ],
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
}
