import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App Development - CW-1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Arial',
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Increment & Toggle Button Actions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final summer = 'summer', winter = 'winter';
  final summerImg = 'assets/img1.jpeg', winterImg = 'assets/img2.jpeg';
  bool isSummerSeason = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeSeason() {
    setState(() {
      isSummerSeason = !isSummerSeason;
    });
  }

  void _resetState() {
    setState(() {
      _counter = 0;
      isSummerSeason = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.lightGreenAccent[100], // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'Push the button to increment the count:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              style: const ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(0, 76, 76, 173)),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 75, 107, 194)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: () {
                _incrementCounter();
              },
              child: Text(
                'Increment',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Column(children: <Widget>[
                    Image.asset(
                      isSummerSeason ? summerImg : winterImg,
                      fit: BoxFit.contain,
                      width: 300,
                    )
                  ]),
                ],
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(0, 123, 211, 89)),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 114, 224, 100)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: () {
                _changeSeason();
              },
              child: Text(
                'Toggle Image',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(0, 76, 76, 173)),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 235, 155, 155)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: () {
                _resetState();
              },
              child: Text(
                'Reset',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
