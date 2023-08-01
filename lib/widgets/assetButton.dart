import 'package:flutter/material.dart';

class AssetButton extends StatelessWidget {
  final String imgpath;
  const AssetButton({super.key, required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 64,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(child: Image.asset(imgpath)),
    );
  }
}
