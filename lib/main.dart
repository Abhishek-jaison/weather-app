import 'package:flutter/material.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Change the color here
          bodySmall: TextStyle(color: Colors.white), // Change the color here
          // You can define other text styles as well, depending on your app's needs
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}