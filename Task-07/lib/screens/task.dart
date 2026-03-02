import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  Task({super.key});

  final List<String> hobbies = ['Sleeping', 'Watching F1', 'Sleeping again'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Task 7"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        actions: [Icon(Icons.favorite_border, color: Colors.white, size: 30)],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              customContainer(
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.person, color: Colors.blue, size: 60),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          "Mohamed Zakaria",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Flutter Developer",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              customContainer(
                child: Text(
                  "Life is like riding a bicycle. To keep your balance , you must keep moving.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              customContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amberAccent),
                        Icon(Icons.star, color: Colors.amberAccent),
                        Icon(Icons.star, color: Colors.amberAccent),
                        Icon(Icons.star, color: Colors.amberAccent),
                        Icon(Icons.star_half, color: Colors.amberAccent),
                      ],
                    ),
                    Text(
                      "150 Reviews",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.share, color: Colors.blue),
                  ],
                ),
              ),
              customContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.code, color: Colors.blue),
                        Text(
                          "EXP:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("~2 Yrs"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.bug_report, color: Colors.blue),
                        Text(
                          "Bugs:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("∞"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.coffee, color: Colors.brown),
                        Text(
                          "Coffee:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("∞"),
                      ],
                    ),
                  ],
                ),
              ),
              customContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🎯 My Hobbies:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: hobbies.length,
                      itemBuilder: (context, i) =>
                          Text("${i + 1}. ${hobbies[i]}"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customContainer({Widget? child}) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color(0xFFe6f0fa),
      border: Border.all(color: Color(0xFF292a2d), width: 2),
    ),
    child: child,
  );
}
