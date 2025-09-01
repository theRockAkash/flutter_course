import 'package:flutter/material.dart';

class VerticalGridScreen extends StatelessWidget {
  const VerticalGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vertical grid Screen")),
      body: Column(
        children: [
          Text("hey There, Welcome to Coding Wizards"),
          SizedBox(height: 16,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent:50
              ),
              itemCount: 1000,
              itemBuilder: (context, index) {
               return Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.grey.shade300,
                  child: Text(index.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
