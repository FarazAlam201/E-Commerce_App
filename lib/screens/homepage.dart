import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> sliderImages = [
    'assets/sliderimages/img1.jpeg',
    'assets/sliderimages/img2.jpeg',
    'assets/sliderimages/img3.jpeg',
    'assets/sliderimages/img4.jpeg',
    'assets/sliderimages/img5.jpeg',
    'assets/sliderimages/img6.jpeg',
    'assets/sliderimages/img7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            CarouselSlider(
              items: sliderImages
                  .map((assetPath) => Image.asset(
                        assetPath,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: screenHeight *
                            0.3, // Adjust the height factor as needed
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
