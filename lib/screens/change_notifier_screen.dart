import 'package:flutter/material.dart';

class ChangeNotifierScreen extends StatelessWidget {
  const ChangeNotifierScreen({super.key});


  @override
  Widget build(BuildContext context) {
    print("========> Build Executed");
    final Counter counter = Counter();
    return Scaffold(
      appBar: AppBar(title: Text("ChangeNotifier Counter")),
      body: Center(
        child: AnimatedBuilder(
          animation: counter,
          builder: (_, __) =>
              Text("Count: ${counter.count}", style: TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
