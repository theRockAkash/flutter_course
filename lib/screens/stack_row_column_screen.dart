import 'package:flutter/material.dart';
import 'package:flutter_course/screens/columns_screen.dart';

class StackRowColumnScreen extends StatelessWidget {
  const StackRowColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Column Rows Screen")),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Column(children: [Box(), Box()]),
          ),

          Positioned(
            bottom: 16,
            left: 32,
            right: 32,
            child: Container(
              color: Colors.grey,

              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.grey.shade800,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey.shade800,
                          height: 24,
                          margin: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                        ),
                        Container(
                          color: Colors.grey.shade800,
                          height: 24,
                          margin: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
