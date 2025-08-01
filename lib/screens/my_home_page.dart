import 'package:counter_practice/widgets/History.dart';
import 'package:counter_practice/widgets/current_counter.dart';
import 'package:counter_practice/widgets/persistent_footer_buttons.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> _lastCounters = [];

  void incrementCounter(int value) {
    setState(() {
      if (_lastCounters.length >= 10) {
        _lastCounters.removeAt(0);
      }
      _lastCounters.add(_counter);
      _counter += value;
    });
  }

  void decrementCounter(int value) {
    setState(() {
      if (_lastCounters.length >= 10) {
        _lastCounters.removeAt(0);
      }
      _lastCounters.add(_counter);
      _counter -= value;
    });
  }

  void deleteHistory() {
    setState(() {
      _lastCounters = [];
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
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
