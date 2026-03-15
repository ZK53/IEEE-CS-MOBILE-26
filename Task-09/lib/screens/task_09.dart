import 'package:flutter/material.dart';
import 'package:task_09/utilities/calculate_bmi.dart';
import 'package:task_09/widgets/age.dart';
import 'package:task_09/widgets/calculate_button.dart';
import 'package:task_09/widgets/gender.dart';
import 'package:task_09/widgets/height.dart';
import 'package:task_09/widgets/weight.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gender = 'male';
  double height = 180;
  int age = 18;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    "BMI Calculator",
                    style: TextStyle(fontSize: 36, color: Colors.amber),
                  ),
                  SizedBox(height: 20),
                  Gender(
                    selectedGender: gender,
                    onGenderSelected: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Height(
                    currentHeight: height,
                    onHeightChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Age(
                        age: age,
                        onAgeChanged: (value) {
                          setState(() {
                            age = value;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      Weight(
                        weight: weight,
                        onWeightChanged: (value) {
                          setState(() {
                            weight = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CalculateButton(
              calculate: () {
                calculateBMI(context, height, weight);
              },
            ),
          ],
        ),
      ),
    );
  }
}
