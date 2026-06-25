import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.item});

  final Map<String, String> item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Image.network(
                height: 300,
                width: double.infinity,
                item["url"]??"",
              ),
            ),
            Text(
              item["title"]??"",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
             Text(
              item["subTitle"]??"",
              style: TextStyle(  fontSize: 12),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Spicy",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 16),
                      LinearProgressIndicator(
                        value: .7,
                        color: Colors.red,
                        minHeight: 10,
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("data", style: TextStyle(color: Colors.green)),
                          Text("data", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Portion"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton.filled(
                          onPressed: () {},
                          icon: Icon(Icons.remove),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("1"),
                        ),
                        IconButton.filled(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(double.infinity, 60)),
                backgroundColor: WidgetStatePropertyAll(Colors.red),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20)),
              ),
              child: Text("Data"),
            ),
          ],
        ),
      ),
    );
  }
}
