import 'package:flutter/material.dart';

class InheritedWidgetScreen extends StatefulWidget {
  const InheritedWidgetScreen({super.key});

  @override
  InheritedWidgetScreenState createState() => InheritedWidgetScreenState();
}

class InheritedWidgetScreenState extends State<InheritedWidgetScreen> {
  int count = 0;

  void increment() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inherited Widget Example")),
      body: CounterData(
        count: count,
        child: Center(child: CounterChild()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterData extends InheritedWidget {
  final int count;

  const CounterData({super.key, required this.count, required super.child});

  static CounterData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterData>()!;

  @override
  bool updateShouldNotify(CounterData oldWidget) => oldWidget.count != count;
}

class CounterChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = CounterData.of(context);
    return Text("Count: ${data.count}", style: TextStyle(fontSize: 24));
  }
}
