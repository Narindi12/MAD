import 'dart:math';  // For generating random data

class _WeatherHomePageState extends State<WeatherHomePage> {
  String cityName = '';
  String temperature = '--';
  String condition = '--';

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
            SizedBox(height: 20),
            Text('City: $cityName'),
            Text('Temperature: $temperature °C'),
            Text('Condition: $condition'),
          ],
        ),
      ),
    );
  }
}
