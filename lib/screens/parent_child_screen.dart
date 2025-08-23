
import 'package:flutter/material.dart';

class ParentChildScreen extends StatefulWidget {
  const ParentChildScreen({super.key});

  @override
  State<ParentChildScreen> createState() => _ParentChildScreenState();
}

class _ParentChildScreenState extends State<ParentChildScreen> {
  int count = 0;

  void increment() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lifting State Up Counter")),
      body: Center(child: CounterChild(count: count, onIncrement: increment)),
    );
  }
}


class CounterChild extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;

  const CounterChild({super.key, required this.count, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Count: $count", style: TextStyle(fontSize: 24)),
        ElevatedButton(onPressed: onIncrement, child: Text("Increment")),
      ],
    );
  }
}