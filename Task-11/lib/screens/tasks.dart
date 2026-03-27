import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check_box, color: Colors.white),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "Watch Suzuka GP",
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.archive)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("7:00 AM"), Text("March 29, 2026")],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
