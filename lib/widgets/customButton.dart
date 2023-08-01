import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: double.infinity,
        decoration: ShapeDecoration(
            color: Color(0xFFEF3651),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 14,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500,
          ),
        )));
  }
}
