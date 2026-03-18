import 'package:flutter/material.dart';
import 'package:task_10/pages/details.dart';
import 'package:task_10/widgets/categories.dart';
import 'package:task_10/widgets/item_card.dart';
import 'package:task_10/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> categories = [
    {"image": "assets/icons/running-shoe.png", "name": "Men"},
    {"image": "assets/icons/high-heels.png", "name": "Women"},
    {"image": "assets/icons/electricity.png", "name": "Electrical"},
    {"image": "assets/icons/extracurricular-activities.png", "name": "Hobbies"},
  ];

  final List<Map<String, String>> products = [
    {
      "image":
          "https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg",
      "title": "Car",
      "subtitle": "Luxury car",
      "price": "\$20000",
    },
    {
      "image":
          "https://images.pexels.com/photos/607812/pexels-photo-607812.jpeg",
      "title": "Phone",
      "subtitle": "Smart phone",
      "price": "\$999",
    },
    {
      "image":
          "https://images.pexels.com/photos/437037/pexels-photo-437037.jpeg",
      "title": "Watch",
      "subtitle": "Smart watch",
      "price": "\$199",
    },
    {
      "image":
          "https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg",
      "title": "Shoes",
      "subtitle": "Running shoes",
      "price": "\$120",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomSearchBar(),
            SizedBox(height: 30),
            Text(
              "Categories",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 105,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Categories(
                    image: categories[index]["image"]!,
                    category: categories[index]["name"]!,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Best Selling",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.90,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Details(data: products[index]),
                      ),
                    );
                  },
                  child: ItemCard(
                    image: products[index]["image"]!,
                    title: products[index]["title"]!,
                    subtitle: products[index]["subtitle"]!,
                    price: products[index]["price"]!,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
