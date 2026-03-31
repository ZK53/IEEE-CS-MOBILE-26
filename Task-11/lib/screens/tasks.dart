import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key, required this.tasks});

  final List<Map> tasks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: tasks.isEmpty
                  ? Center(child: Text("No Added Tasks"))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box, color: Colors.white),
                          ),
                          title: Row(
                            children: [
                              Text(
                                tasks[index]['title'],
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.archive),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tasks[index]['time']),
                                Text(tasks[index]['date']),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: tasks.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
