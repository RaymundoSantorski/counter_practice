import 'package:flutter/material.dart';

class CurrentCounter extends StatelessWidget {
  const CurrentCounter({super.key, required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return Center(
      child: SizedBox(
        width: 300,
        height: 100,
        child: Card(
          color: theme.secondaryContainer,
          child: Center(
            child: Text(
              '$counter',
              style: TextStyle(
                color: theme.onSecondaryContainer,
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
