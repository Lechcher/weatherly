import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherly/app_router.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.presentError(details);
  // };

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const ProviderScope(child: Application()));
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultFontFamily = 'Itim';
    const defaultTextColor = Color(0xFF0F172A);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Weatherly',
      theme: ThemeData(
        fontFamily: defaultFontFamily,
        primarySwatch: Colors.blue,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          onSurface: defaultTextColor,
        ),

        textTheme: ThemeData().textTheme.apply(
          bodyColor: defaultTextColor,
          displayColor: defaultTextColor,
          fontFamily: defaultFontFamily,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
