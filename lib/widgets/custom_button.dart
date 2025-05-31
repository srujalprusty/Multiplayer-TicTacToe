
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap , required this.text});

final VoidCallback onTap;
final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
       boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 67, 67, 89),
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 4),
        )
       ]
      ),
      child: ElevatedButton(onPressed: onTap,
       style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width,
          50
        ),
          backgroundColor: const Color.fromARGB(255, 12, 12, 212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
       child: Text(text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
       ),
      ),
    );
  }
}