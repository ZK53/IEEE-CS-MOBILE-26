import 'package:flutter/material.dart';

import 'bmi_message.dart';

void calculateBMI(BuildContext context, double height, int weight) {
  double bmi = weight / ((height / 100) * (height / 100));

  String message;
  String content;
  IconData icon;
  Color color;

  if (bmi < 18.5) {
    message = "Underweight";
    content =
        "Your BMI indicates that you are underweight. It's important to maintain a healthy weight. Consider consulting a healthcare provider for guidance.";
    icon = Icons.sentiment_dissatisfied;
    color = Colors.blueAccent;
  } else if (bmi >= 18.5 && bmi < 25) {
    message = "Normal Weight";
    content =
        "Your BMI is within the normal weight range. Keep up the good work and maintain a balanced diet and regular exercise.";
    icon = Icons.sentiment_satisfied_alt;
    color = Colors.green;
  } else if (bmi >= 25 && bmi < 30) {
    message = "Overweight";
    content =
        "Your BMI indicates that you are overweight. Consider adopting a healthy plan and incoporating regular exercise into your routine.";
    icon = Icons.sentiment_neutral;
    color = Colors.orange;
  } else {
    message = "Obese";
    content =
        "Your BMI suggests obesity, It's important to consult a healthcare provider to dicuss ways to achieve a healthier weight.";
    icon = Icons.sentiment_very_dissatisfied;
    color = Colors.red;
  }

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Icon(
            icon,
            color: color,
            size: 70,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " ${bmi.toStringAsFixed(1)}",
                style: TextStyle(fontSize: 40, color: color),
              ),
              Text(
                message,
                style: TextStyle(
                  fontSize: 30,
                  color: color,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () =>
                    messageDialog(context, message, content, color),
                icon: Icon(
                  Icons.error,
                  color: color,
                  size: 30,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ))
          ],
        );
      });
}
