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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<int> _lastCounters = [];

  void incrementCounter() {
    setState(() {
      if (_lastCounters.length >= 10) {
        _lastCounters.removeAt(0);
      }
      _counter++;
      _lastCounters.add(_counter);
    });
  }

  void decrementCounter() {
    setState(() {
      if (_lastCounters.length >= 10) {
        _lastCounters.removeAt(0);
      }
      _counter--;
      _lastCounters.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('$_counter'),
            Text('History'),
            for (int count in _lastCounters) Text('$count'),
            IconButton(onPressed: decrementCounter, icon: Icon(Icons.remove)),
            IconButton(onPressed: incrementCounter, icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
