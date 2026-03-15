import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  const Gender({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  final String selectedGender;
  final ValueChanged onGenderSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onGenderSelected('male'),
            child: Container(
              padding: EdgeInsets.only(top: 15, bottom: 30),
              decoration: BoxDecoration(
                border: selectedGender == 'male'
                    ? Border.all(color: Colors.blue, width: 3)
                    : null,
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(Icons.male, size: 90, color: Colors.blue),
                  Text("Male", style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: GestureDetector(
            onTap: () => onGenderSelected('female'),
            child: Container(
              padding: EdgeInsets.only(top: 15, bottom: 30),
              decoration: BoxDecoration(
                border: selectedGender == 'female'
                    ? Border.all(color: Colors.pink, width: 3)
                    : null,
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(Icons.female, size: 90, color: Colors.pink),
                  Text("Female", style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
