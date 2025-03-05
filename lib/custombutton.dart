import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.function, required this.str});

  final String str;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: (str == 'C'||str == '⌫') ? Colors.red : (str == '=' ? Colors.green : Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            str,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}