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

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Center(
        child: Text('Enter a city to get weather information'),
      ),
    );
  }
}
