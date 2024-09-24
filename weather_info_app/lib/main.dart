class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String cityName = '';

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
              onPressed: () {
                // Simulated weather fetch action
              },
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            // Placeholder for weather information
            Text('City: $cityName'),
            Text('Temperature: -- °C'),
            Text('Condition: --'),
          ],
        ),
      ),
    );
  }
}
