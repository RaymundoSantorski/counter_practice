import 'package:counter_practice/widgets/History.dart';
import 'package:counter_practice/widgets/current_counter.dart';
import 'package:counter_practice/widgets/persistent_footer_buttons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> _lastCounters = [];

  @override
  void initState() {
    super.initState();
    getCounter();
  }

  Future<void> getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? -2;
    List<String> lastCounters = prefs.getStringList('history') ?? [];
    print(counter);
    setState(() {
      _counter = counter;
      _lastCounters = lastCounters.map((value) => int.parse(value)).toList();
    });
  }

  Future<void> incrementCounter(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_lastCounters.length >= 10) {
        _lastCounters.removeAt(0);
      }
      _lastCounters.add(_counter);
      _counter = (prefs.getInt('counter') ?? 0) + value;
      prefs.setInt('counter', _counter);
      prefs.setStringList(
        'history',
        _lastCounters.map((value) => '$value').toList(),
      );
    });
  }

  Future<void> decrementCounter(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_lastCounters.length >= 10) {
        _lastCounters.removeAt(0);
      }
      _lastCounters.add(_counter);
      _counter = (prefs.getInt('counter') ?? 0) - value;
      prefs.setInt('counter', _counter);
      prefs.setStringList(
        'history',
        _lastCounters.map((value) => '$value').toList(),
      );
    });
  }

  Future<void> deleteHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastCounters = [];
      prefs.setStringList(
        'history',
        _lastCounters.map((value) => '$value').toList(),
      );
    });
  }

  Future<void> resetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.onPrimary,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: theme.onPrimary, fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.primary,
      ),
      persistentFooterButtons: [
        PersistentFooterButtons(
          decrementCounter: decrementCounter,
          incrementCounter: incrementCounter,
          counter: _counter,
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: deleteHistory,
        backgroundColor: theme.primary,
        child: Icon(Icons.restart_alt, size: 40, color: theme.onPrimary),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CurrentCounter(counter: _counter, reset: resetCounter),
            Divider(color: theme.primary, indent: 20, endIndent: 20),
            Expanded(child: History(history: _lastCounters)),
          ],
        ),
      ),
    );
  }
}
