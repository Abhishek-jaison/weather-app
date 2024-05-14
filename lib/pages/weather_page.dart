import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final _weatherService = WeatherService('4615a528b89bb02e803efe9b39b333e8');
  Weather? _weather;


  _fetchWeather() async{
    String cityname=await _weatherService.getcurrentCity();

    try{
      final weather= await _weatherService.getWeather(cityname);
      setState(() {
        _weather= weather;
      });
    }

    catch(e){
      print(e);
    }

  }


String getWeatherAnimation(String? maincondition){
  if(maincondition == null)
  return 'assets/sunny.json';

  switch(maincondition.toLowerCase()){
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/cloudy.json';
    case 'rain':
    case 'drizzle':
    case'shower rain':
     return 'assets/rainy.json';
    case 'thinderstorm':
     return 'assets/thunder.json';
    case 'clear':
      return 'assets/sunny.json';
    default:
      return 'assets/sunny.json';


  }

}

  @override
  void initState(){
    super.initState();
    _fetchWeather();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],

      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityname??"loading city...",
             style: TextStyle(
              fontSize: 30,
            color: const Color.fromARGB(255, 255, 255, 255),),),
            
        
            Lottie.asset(getWeatherAnimation(_weather?.maincondition)),

            Text('${_weather?.temperature.round()}°C',
            style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),),),

            Text(_weather?.maincondition ?? "",
             style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),),),
            

          ]
        ),
      ),
    );
  }
}