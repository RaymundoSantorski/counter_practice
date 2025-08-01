import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key, required this.history});
  final List<int> history;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return ListView(
      children: [
        for (int count in history.reversed)
          Center(
            child: SizedBox(
              width: 100,
              height: 60,
              child: Card(
                color: theme.secondaryContainer,
                child: Center(
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: theme.onSecondaryContainer,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
