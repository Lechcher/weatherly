import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';
import 'package:weatherly/core/responsive_svg/svg_loader_cache.dart';

class ResponsiveSvg extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final double? size;
  final ColorFilter? colorFilter;
  final BoxFit fit;

  const ResponsiveSvg({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.size,
    this.colorFilter,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final double? effectiveWidth = width ?? size;
    final double? effectiveHeight = height ?? size;

    return SizedBox(
      width: effectiveWidth,
      height: effectiveHeight,
      child: FittedBox(
        fit: fit,

        child: VectorGraphic(
          loader: SvgLoaderCache.get(assetPath),
          colorFilter: colorFilter,
        ),
      ),
    );
  }
}
