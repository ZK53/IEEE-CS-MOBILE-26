import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

BottomBarItem bottomBarItem({required IconData icon, required String label}) {
  return BottomBarItem(
    inActiveItem: Icon(icon, color: Colors.white),
    activeItem: Icon(icon, color: Colors.green),
    // itemLabel: label,
    itemLabelWidget: Text(label, style: TextStyle(color: Colors.white)),
  );
}

TextFormField taskField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  required GestureTapCallback onTap,
  required bool readOnly
}) {
  return TextFormField(
    controller: controller,
    readOnly: readOnly,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      labelText: label,
      prefixIcon: Icon(icon),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "Please fill this field";
      }
      return null;
    },
    onTap: onTap,
  );
}
