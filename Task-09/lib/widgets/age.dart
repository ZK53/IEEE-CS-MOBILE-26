import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  const Age({super.key, required this.age, required this.onAgeChanged});

  final int age;
  final ValueChanged onAgeChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 30),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Age", style: TextStyle(fontSize: 34)),
            SizedBox(height: 10),
            Text(age.toString(), style: TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => onAgeChanged(age > 1 ? age - 1 : age),
                  icon: Icon(Icons.remove_circle_rounded, size: 35),
                ),
                IconButton(
                  onPressed: () => onAgeChanged(age + 1),
                  icon: Icon(Icons.add_circle_rounded, size: 35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
