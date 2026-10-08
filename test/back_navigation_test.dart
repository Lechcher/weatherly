import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherly/app_router.dart';
import 'package:weatherly/screens/settings_screen.dart';

/// Regression coverage for the system back button on the nested routes.
///
/// `WidgetsBinding.handlePopRoute` is the exact entry point Android's back
/// button (and iOS' pop gesture) goes through, so asserting on it exercises
/// the real back-navigation path instead of a simulated one.
///
/// The nested routes live under a plain `ShellRoute`, not a
/// `StatefulShellRoute`, so `GoRouter` pops them through the root navigator
/// automatically and no `HistoryBackscope`-style wrapper is required.
void main() {
  testWidgets('system back returns from a nested route to /weatherly', (
    tester,
  ) async {
    final router = AppRouter.router;

    await tester.pumpWidget(
      ProviderScope(child: MaterialApp.router(routerConfig: router)),
    );

    // Let the splash screen's preload timer elapse so it hands off to
    // /weatherly.
    await tester.pump(const Duration(seconds: 4));
    await tester.pump(const Duration(seconds: 1));

    expect(router.state.uri.path, '/weatherly');

    router.push('/weatherly/settings');
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(SettingsScreen), findsOneWidget);
    expect(router.state.uri.path, '/weatherly/settings');

    // Back from the nested route must be handled by the router.
    final handledBack = await tester.binding.handlePopRoute();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(handledBack, isTrue);
    expect(router.state.uri.path, '/weatherly');
    expect(find.byType(SettingsScreen), findsNothing);

    // Back at the root is intentionally not handled so the OS closes the app.
    final handledBackAtRoot = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(handledBackAtRoot, isFalse);

    // Drain the splash/preload timers started during the test.
    await tester.pump(const Duration(seconds: 4));
  });
}
