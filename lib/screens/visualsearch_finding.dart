import 'dart:io';

import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class VisualFinding extends StatefulWidget {
  final File? searchImage;
  const VisualFinding({super.key, required this.searchImage});

  @override
  State<VisualFinding> createState() => _VisualFindingState();
}

class _VisualFindingState extends State<VisualFinding> {
  void toHomepageWithBottomBar() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShowBottomBAr()));
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), toHomepageWithBottomBar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.file(
              widget.searchImage!,
              width: 235,
              height: 237,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Icon(
                Icons.search,
                color: redButton,
                size: 62,
              ),
            ),
            Text('Finding similar results...',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: white5)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
