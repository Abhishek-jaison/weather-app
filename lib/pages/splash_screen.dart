import 'package:flutter/material.dart';
import 'dart:async';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/weather_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => WeatherPage(),
        ),
      );
    });

    return Container(
      color: Colors.grey[800],
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset('assets/icon1.png',height: 50,width: 50,)
          ],
        ),
      ),
    );
  }
}