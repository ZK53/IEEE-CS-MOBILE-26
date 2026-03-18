import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.image, required this.category});

  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            height: 70,
            width: 70,
            child: Image.asset(image),
          ),
          SizedBox(height: 10),
          Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
