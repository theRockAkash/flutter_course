import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatelessWidget {
  const StreamBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StreamController<int> controller = StreamController<int>.broadcast();
    int count = 0;

    return Scaffold(
      appBar: AppBar(title: Text("Stream Builder Example")),
      body: Center(
        child: StreamBuilder<int>(
          stream: controller.stream,
          initialData: count,
          builder: (_, snapshot) =>
              Text("Count: ${snapshot.data}", style: TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          controller.sink.add(count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
