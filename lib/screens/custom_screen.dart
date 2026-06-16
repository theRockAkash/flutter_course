import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  final cardList = const [
    {
      "image":
          "https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=800",
      "title": "Time to Play and Learn",
      "color": const Color(0xFFFFE4EC), // light pink
      "action": "Start Learning",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1484820540004-14229fe36ca4?w=800",
      "title": "Let's Read Together",
      "color": const Color(0xFFE3F2FD), // light blue
      "action": "Read Now",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1502086223501-7ea6ecd79368?w=800",
      "title": "Fun With\nColors",
      "color": const Color(0xFFE8F5E9), // light green
      "action": "Explore Colors",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1542810634-71277d95dcbb?w=800",
      "title": "Learn New Things",
      "color": const Color(0xFFFFF3E0), // light orange
      "action": "Discover More",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 72,
        leading: CircleAvatar(backgroundImage: AssetImage("images/logo.jpeg")),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Thu, Jun 26", style: TextStyle(fontSize: 12)),
            Text("Mariam", style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink.shade100,
                  Color(0xFFFFE4EC),
                  Colors.yellow.shade100,
                ],
              ),
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Parenting Journey,\nStep by Step",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                Text(
                  "Bonding starts with small moments. Try today's tip when you get a quiet minute.",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Today's Plan",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),

                Text("See All"),
                Icon(Icons.navigate_next),
              ],
            ),
          ),
          SizedBox(
            height: 156,
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = cardList[index];
                return buildContainer(item);
              },
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: cardList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Milestone",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),

                Text("See All"),
                Icon(Icons.navigate_next),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(16),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Text("S"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Text("M"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Text("T"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 12,
                      child: Text("W"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Text("T"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Text("F"),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Text("S"),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateCircle("12"),
                    buildDateCircle("13"),
                    buildDateCircle("14"),
                    buildDateCircle("15",color: Colors.pinkAccent.shade100),
                    buildDateCircle("16"),
                    buildDateCircle("17"),
                    buildDateCircle("18"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateCircle(String date, {Color color=Colors.white}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      padding: EdgeInsets.all(1),
      child: CircleAvatar(backgroundColor: color, child: Text(date)),
    );
  }

  Container buildContainer(Map<String, Object> item) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item["color"] as Color,
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(item["image"] as String)),
          SizedBox(height: 8),
          Text(
            item["title"] as String,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
