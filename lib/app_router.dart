import 'package:go_router/go_router.dart';
import 'package:weatherly/core/gorouter/main_shell.dart';
import 'package:weatherly/screens/location_screen.dart';
import 'package:weatherly/screens/settings_screen.dart';
import 'package:weatherly/screens/splash_screen.dart';
import 'package:weatherly/screens/weatherly_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/weatherly',
                builder: (context, state) => const WeatherlyScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/location',
                builder: (context, state) => const LocationScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
