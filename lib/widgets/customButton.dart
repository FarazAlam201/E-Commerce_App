import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? callback;
  const CustomButton({
    super.key,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          height: 48,
          width: double.infinity,
          decoration: ShapeDecoration(
              color: Color(0xFFEF3651),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 14,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w500,
            ),
          ))),
    );
  }
}
