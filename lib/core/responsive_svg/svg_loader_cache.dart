import 'package:vector_graphics/vector_graphics_compat.dart';

class SvgLoaderCache {
  static final Map<String, AssetBytesLoader> _cache = {};

  static AssetBytesLoader get(String assetPath) =>
      _cache.putIfAbsent(assetPath, () => AssetBytesLoader(assetPath));

  static void clear() => _cache.clear();
}
