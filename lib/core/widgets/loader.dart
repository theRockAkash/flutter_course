import 'package:flutter/material.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Text("Loading")
        ],
      ),
    );
  }
}
