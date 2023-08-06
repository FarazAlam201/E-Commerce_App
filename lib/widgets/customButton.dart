import 'package:e_commerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color btncolor;
  final Color? bordercolor;
  final Color? fontcolor;
  final VoidCallback? callback;
  CustomButton({
    super.key,
    required this.text,
    required this.callback,
    this.bordercolor,
    this.fontcolor,
    Color? btncolor,
  }) : btncolor = btncolor ?? redButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: bordercolor ?? transparent, width: 2),
            color: btncolor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
              child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ))),
    );
  }
}
