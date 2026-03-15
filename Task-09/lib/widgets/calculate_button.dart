import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key, required this.calculate});

  final VoidCallback calculate;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromARGB(255, 255, 118, 76),
      height: 90,
      minWidth: double.infinity,
      onPressed: calculate,
      child: const Text(
        'CALCULATE BMI',
        style: TextStyle(fontSize: 40, color: Colors.black),
      ),
    );
  }
}
