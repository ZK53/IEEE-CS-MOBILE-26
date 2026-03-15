import 'package:flutter/material.dart';

class Weight extends StatelessWidget {
  const Weight({
    super.key,
    required this.weight,
    required this.onWeightChanged,
  });

  final int weight;
  final ValueChanged onWeightChanged;

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
            Text("Weight", style: TextStyle(fontSize: 34)),
            SizedBox(height: 10),
            Text(weight.toString(), style: TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () =>
                      onWeightChanged(weight > 1 ? weight - 1 : weight),
                  icon: Icon(Icons.remove_circle_rounded, size: 35),
                ),
                IconButton(
                  onPressed: () => onWeightChanged(weight + 1),
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
