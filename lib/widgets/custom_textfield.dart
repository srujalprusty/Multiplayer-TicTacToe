import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  const CustomTextfield({super.key, required this.controller, required this.hintText, this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.white,
          blurRadius: 10,
          
        )
        ]
      ),
        child: TextField(
          readOnly: isReadOnly,
          controller:controller,
          decoration: InputDecoration(
            fillColor: bgColor,
            filled: true,
            hintText: hintText,
            ),
        ),
    );
  }
}