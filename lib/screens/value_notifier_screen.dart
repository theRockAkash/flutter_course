import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatelessWidget {
  const ValueNotifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> counter = ValueNotifier<int>(0);
    final ValueNotifier<int> counter2 = ValueNotifier<int>(0);
   print("=========> build executed");
    return Scaffold(
      appBar: AppBar(title: Text("Value Notifier Example")),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: counter,
            builder: (_, value1, __)  {
              return ValueListenableBuilder<int>(
                valueListenable: counter2,
                builder: (_, value2, __) =>
                    Text("Count: $value1 $value2", style: TextStyle(fontSize: 24)),
              );
            }
          ),
         ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (_, value, __) =>
                Text("Count: $value", style: TextStyle(fontSize: 24)),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value=counter.value+1,
        child: Icon(Icons.add),
      ),
    );
  }
}
