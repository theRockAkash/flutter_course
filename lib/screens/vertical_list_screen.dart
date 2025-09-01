import 'package:flutter/material.dart';

class VerticalListScreen extends StatelessWidget {
  const VerticalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list =[1,2,3,4];
    return Scaffold(
      appBar: AppBar(title: Text("Vertical List Screen")),
      body: listViewWithSeparator(),
    );
  }
  Widget listViewWithSeparator(){
    return Column(
      children: [
        Container(
            color: Colors.grey,
            width: double.infinity,
            child: Column(
              children: [
                Text("Item 1"),
                Text("Item 2"),
              ],
            )),

        Expanded(
          child: ListView.separated(
            itemCount: 50,
            separatorBuilder: (context, index) => Divider(height: 1,),
            itemBuilder: (context, index) {
              return ListTile(title: Text("List Tile"),tileColor:Colors.red,);
            },
          ),
        ),
      ],
    );
  }
}
