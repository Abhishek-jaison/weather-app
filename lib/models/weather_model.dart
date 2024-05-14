class Weather{
  final String cityname;
  final double temperature;
  final String maincondition;

  Weather({
    required this.cityname,
    required this.temperature,
    required this.maincondition,
  });


  factory Weather.fromJson(Map<String ,dynamic> json){
    return Weather(cityname: json['name'],
      temperature: json['main']['temp'].toDouble(),
      maincondition: json['weather'][0]['main'],
      );
  }
}
