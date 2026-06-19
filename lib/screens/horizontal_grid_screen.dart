
import 'package:flutter/material.dart';

class HorizontalGridScreen extends StatelessWidget {
  const HorizontalGridScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(title: Text("Vertical grid Screen")),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent:300
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
          )
        ],
      ),
    );;
  }
}
