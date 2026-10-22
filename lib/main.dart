import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/not_found_screen.dart';

void main() {
  runApp(const NusaTravelApp());
}

class NusaTravelApp extends StatelessWidget {
  const NusaTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NusaTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey.shade50,
        fontFamily: 'Roboto',
      ),
      // 1. Initial Route
      initialRoute: AppRoutes.splash,
      
      // 2. Named Routes
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.booking: (context) => const BookingScreen(),
      },

      // 3. onGenerateRoute untuk menangani rute yang membutuhkan argumen dinamis (Detail Screen)
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.detail) {
          return MaterialPageRoute(
            builder: (context) => const DetailScreen(),
            settings: settings,
          );
        }
        return null;
      },

      // 4. onUnknownRoute untuk menangani rute tidak valid (Error 404)
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      },
    );
  }
}