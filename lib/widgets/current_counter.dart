import 'package:flutter/material.dart';

class CurrentCounter extends StatelessWidget {
  const CurrentCounter({super.key, required this.counter, required this.reset});
  final int counter;
  final reset;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$counter',
                  style: TextStyle(
                    color: theme.onSecondaryContainer,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                IconButton(
                  onPressed: reset,
                  icon: Icon(
                    Icons.restore,
                    size: 35,
                    color: theme.onPrimaryFixedVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
