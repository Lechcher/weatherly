import 'package:go_router/go_router.dart';
import 'package:weatherly/core/gorouter/main_shell.dart';
import 'package:weatherly/screens/location_screen.dart';
import 'package:weatherly/screens/settings_screen.dart';
import 'package:weatherly/screens/splash_screen.dart';
import 'package:weatherly/screens/weatherly_screen.dart';
import 'package:weatherly/widgets/widgets_components/build_platform_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MainShellScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/weatherly',
            builder: (context, state) => const WeatherlyScreen(),
            routes: [
              GoRoute(
                path: 'location',
                pageBuilder: (context, state) => buildPlatformPage(
                  context: context,
                  state: state,
                  child: const LocationScreen(),
                ),
              ),
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) => buildPlatformPage(
                  context: context,
                  state: state,
                  child: const SettingsScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
