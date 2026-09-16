import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherly/core/gorouter/history_backscope.dart';

class MainShellScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return HistoryBackscope(
      navigationShell: navigationShell,

      child: Scaffold(body: navigationShell),
    );
  }
}
