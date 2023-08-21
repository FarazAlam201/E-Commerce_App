import 'package:flutter/material.dart';

class Bagpage extends StatefulWidget {
  const Bagpage({super.key});

  @override
  State<Bagpage> createState() => _BagpageState();
}

class _BagpageState extends State<Bagpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        "Bag Page",
        style: TextStyle(fontSize: 35, color: Colors.white),
      ),
    ));
  }
}
