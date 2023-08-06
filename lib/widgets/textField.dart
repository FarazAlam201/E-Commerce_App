import 'package:e_commerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowTextField extends StatefulWidget {
  final String textHint;
  bool hiddenData;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction moveToNextTextField;

  ShowTextField({
    super.key,
    required this.textHint,
    this.controller,
    this.hiddenData = false,
    this.suffixIcon,
    this.moveToNextTextField = TextInputAction.next,
  });

  @override
  State<ShowTextField> createState() => _ShowTextFieldState();
}

class _ShowTextFieldState extends State<ShowTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.hiddenData,
      controller: widget.controller,
      textInputAction: widget.moveToNextTextField,
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: white5,
      decoration: InputDecoration(
        labelText: widget.textHint,
        suffixIcon: widget.textHint == 'Password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.hiddenData = !widget.hiddenData;
                  });
                },
                icon: Icon(
                  widget.hiddenData
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                ),
              )
            : null,
        hintText: widget.textHint,
      ),
    );
  }
}
