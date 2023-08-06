import 'dart:io';

import 'package:flutter/material.dart';

class VisualFinding extends StatefulWidget {
  final File? searchImage;
  const VisualFinding({super.key, required this.searchImage});

  @override
  State<VisualFinding> createState() => _VisualFindingState();
}

class _VisualFindingState extends State<VisualFinding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.file(
            widget.searchImage!,
            width: 30,
          )
        ],
      ),
    );
  }
}
