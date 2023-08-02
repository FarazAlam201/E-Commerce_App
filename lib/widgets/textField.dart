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
      style: const TextStyle(
        fontFamily: 'Metropolis',
        fontSize: 14,
        color: Color(0xffF5F5F5),
      ),
      cursorColor: const Color(0xffF5F5F5),
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
                  color: const Color(0xFFABB4BD),
                ))
            : null,
        labelStyle: const TextStyle(
          color: Color(0xFFABB4BD),
        ),
        filled: true,
        fillColor: Color(0xff2A2C36),
        hintText: widget.textHint,
        hintStyle: const TextStyle(
          color: Color(0xFFABB4BD),
          fontSize: 14,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff1E1F28)),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff1E1F28), width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
