import 'package:flutter/material.dart';

class HorizontalListScreen extends StatelessWidget {
  const HorizontalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Horizontal List Screen")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hey There, Welcome Back!"),
          SizedBox(height: 16),
          Text("Recentrly Viewed items", style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 30,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
                  child: Text("data"),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Text("Popular Items", style: TextStyle(fontWeight: FontWeight.w600)),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {

                  },
                  leading: CircleAvatar(child: Text('A')),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
                  tileColor: Colors.grey,
                  dense: true,
                  selectedTileColor: Colors.green,
                  selected: index%2==0,
                  title: Text("list title"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('subtitle'),
                      Text('third subtitle'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
