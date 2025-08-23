import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatelessWidget {
  const ValueNotifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> counter = ValueNotifier<int>(0);
    return Scaffold(
      appBar: AppBar(title: Text("Value Notifier Example")),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: counter,
          builder: (_, value, __) =>
              Text("Count: $value", style: TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        child: Icon(Icons.add),
      ),
    );
  }
}
