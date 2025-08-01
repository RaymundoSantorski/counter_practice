import 'package:flutter/material.dart';

class PersistentFooterButtons extends StatefulWidget {
  PersistentFooterButtons({
    super.key,
    required this.decrementCounter,
    required this.incrementCounter,
    required this.counter,
  });
  var decrementCounter;
  var incrementCounter;
  final int counter;

  @override
  State<PersistentFooterButtons> createState() =>
      _PersistentFooterButtonsState();
}

class _PersistentFooterButtonsState extends State<PersistentFooterButtons> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    final TextEditingController _controller = TextEditingController(
      text: '$value',
    );

    void onTextChanged() {
      try {
        setState(() {
          value = int.parse(_controller.text);
        });
      } catch (error) {
        _controller.text = '$value';
        return;
      }
    }

    return Row(
      children: [
        IconButton(
          onPressed: () => widget.decrementCounter(value),
          icon: Icon(Icons.remove),
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              width: 100,
              height: 40,
              child: Card(
                color: theme.secondaryContainer,
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  onSubmitted: (value) => onTextChanged(),
                  controller: _controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
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
        IconButton(
          onPressed: () => widget.incrementCounter(value),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
