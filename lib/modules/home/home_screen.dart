import 'package:flutter/material.dart';
import 'package:flutter_course/modules/home/home_viewmodel.dart';
import 'package:flutter_course/modules/product/product_detail_screen.dart';

class HomeScreen extends StatelessWidget  with HomeViewmodel {
   HomeScreen({super.key});

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
            Text("Order your favourite food!", style: TextStyle(fontSize: 12)),
          ],
        ),
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [
          CircleAvatar(backgroundImage: AssetImage("images/logo.jpeg")),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context,value, child) {
          return IndexedStack(
            index: value,
            children: [
            MainScreen(productList: productList),
            Text("Favourites"),
              Text("Cart"),
              Text("Profile"),
              Text("Settings"),

          ],);
        }
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context,value, child) {
          return BottomNavigationBar(
            currentIndex: value,
            unselectedItemColor: Colors.red.shade100,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: (value) {
              currentIndex.value=value;
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          );
        }
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.productList,
  });

  final List<Map<String, String>> productList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
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
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 16),
              ChoiceChip(
                label: Text("All"),
                selected: true,
                showCheckmark: false,
                selectedColor: Colors.red,
                labelStyle: TextStyle(color: Colors.white),
                checkmarkColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text("Combos"),
                selected: false,
                color: WidgetStatePropertyAll(Colors.grey.shade300),
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text("Combos"),
                selected: false,
                color: WidgetStatePropertyAll(Colors.grey.shade300),
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text("Combos"),
                selected: false,
                color: WidgetStatePropertyAll(Colors.grey.shade300),
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text("Combos"),
                selected: false,
                color: WidgetStatePropertyAll(Colors.grey.shade300),
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text("Combos"),
                selected: false,
                color: WidgetStatePropertyAll(Colors.grey.shade300),
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: productList.length,
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 205,
            ),
            itemBuilder: (context, index) {
              final item = productList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(item:item),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(item["url"] ?? "", height: 120),
                        ),
                        Text(
                          item["title"] ?? "",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(item["subTitle"]!, style: TextStyle(fontSize: 12)),

                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 14),
                            Text("4.5", style: TextStyle(fontSize: 12)),
                            Spacer(),
                            Icon(Icons.favorite_border, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
