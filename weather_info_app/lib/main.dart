import 'dart:math';  // For generating random data
import 'package:flutter/material.dart';
void main() {
  runApp(WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String cityName = '';
  String temperature = '--';
  String condition = '--';
  List<String> forecast = List.filled(7, '--'); 

void fetch7DayForecast() {
  final random = Random();
  setState(() {
    for (int i = 0; i < 7; i++) {
      forecast[i] = '${15 + random.nextInt(16)} °C, ' +
                    (['Sunny', 'Cloudy', 'Rainy'][random.nextInt(3)]);
    }
  });
}

Widget buildForecast() {
  return Column(
    children: forecast.asMap().entries.map((entry) {
      return Text('Day ${entry.key + 1}: ${entry.value}');
    }).toList(),
  );
}
  void fetchWeather() {
    final random = Random();
    setState(() {
      temperature = (15 + random.nextInt(16)).toString(); // 15°C to 30°C
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      condition = conditions[random.nextInt(conditions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter City Name'),
              onChanged: (value) {
                setState(() {
                  cityName = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            ElevatedButton(
  onPressed: fetch7DayForecast,
  child: Text('Fetch 7-Day Forecast'),
),
            SizedBox(height: 20),
            Text('City: $cityName'),
            Text('Temperature: $temperature °C'),
            Text('Condition: $condition'),
            buildForecast(),
          ],
        ),
      ),
    );
  }
}
