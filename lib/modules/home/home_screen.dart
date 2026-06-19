import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: SizedBox(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FoodGo",
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text("Order your favourite food!", style: TextStyle(fontSize: 12))
          ],
        ),
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [
          CircleAvatar(backgroundImage: AssetImage("images/logo.jpeg")),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      labelText: "Search",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton.filled(onPressed: () {}, icon: Icon(Icons.tune)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
