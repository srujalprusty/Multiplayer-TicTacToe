import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  const CustomeText({super.key,
    required this.shadows,
    required this.text,
    required this.fontSize,
  });

  final List<Shadow> shadows ;
  final String text;
  final double fontSize;
  

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: shadows,
      ),
    );
  }
}