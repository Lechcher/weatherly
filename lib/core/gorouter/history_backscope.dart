import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryBackscope extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final Widget child;

  const HistoryBackscope({
    super.key,
    required this.navigationShell,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) async =>
          navigationShell.goBranch(0),

      child: child,
    );
  }
}
