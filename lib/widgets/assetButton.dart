import 'package:e_commerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class AssetButton extends StatelessWidget {
  final String imgpath;
  final VoidCallback? callback;
  const AssetButton({super.key, required this.imgpath, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 92,
        height: 64,
        decoration: ShapeDecoration(
          color: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Center(child: Image.asset('assets/images/$imgpath.png')),
      ),
    );
  }
}
