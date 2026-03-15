import 'package:flutter/material.dart';

void messageDialog(
    BuildContext context, String message, String content, Color color) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          titlePadding: const EdgeInsets.only(right: 5, left: 5),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80, left: 0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  iconSize: 40,
                ),
              ),
              Text(
                message,
                style: TextStyle(fontSize: 30, color: color),
              ),
            ],
          ),
          content: Text(
            content,
            style: TextStyle(fontSize: 22, color: color),
          ),
          contentPadding:
              const EdgeInsets.only(bottom: 30, left: 40, right: 40),
        );
      });
}
