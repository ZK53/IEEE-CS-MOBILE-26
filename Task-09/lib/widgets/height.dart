import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  const Height({
    super.key,
    required this.currentHeight,
    required this.onHeightChanged,
  });

  final double currentHeight;
  final ValueChanged onHeightChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),
            SizedBox(height: 10),
            Text(
              "${currentHeight.toInt().toString()} cm",
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: currentHeight,
              onChanged: onHeightChanged,
              min: 120,
              max: 220,
              activeColor: Colors.orange,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
