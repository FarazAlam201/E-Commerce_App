import 'package:flutter/material.dart';

class ShowTextField extends StatelessWidget {
  final String textHint;
  final bool hiddenData;
  final IconButton? suffixIcon;
  final TextInputAction moveToNextTextField;
  final TextEditingController _controller = TextEditingController();

  ShowTextField(
      {super.key,
      required this.textHint,
      this.hiddenData = false,
      this.suffixIcon,
      this.moveToNextTextField = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hiddenData,
      controller: _controller,
      textInputAction: moveToNextTextField,
      style: const TextStyle(
          fontFamily: 'Metropolis', fontSize: 14, color: Color(0xffF5F5F5)),
      cursorColor: const Color(0xffF5F5F5),
      decoration: InputDecoration(
        labelText: textHint,
        suffixIcon: suffixIcon,
        labelStyle: const TextStyle(
          color: Color(0xFFABB4BD),
        ),
        filled: true,
        fillColor: Color(0xff2A2C36),
        hintText: textHint,
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
