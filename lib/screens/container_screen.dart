import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container Screen")),
      body: Container(
        color: Colors.grey.withAlpha(100),
        margin: EdgeInsets.all(16),
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(16),
        child: Container( 
        decoration: BoxDecoration(color: Colors.pinkAccent.withAlpha(100),border: Border.all(color: Colors.pinkAccent,width: 1),
            borderRadius: BorderRadius.circular(12)),),
      ),
    );
  }
}
