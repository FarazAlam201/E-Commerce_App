import 'dart:io';

import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/visualsearch_finding.dart';
import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:e_commerce_app/widgets/bottombar.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class VisualSearch extends StatefulWidget {
  const VisualSearch({super.key});

  @override
  State<VisualSearch> createState() => _VisualSearchState();
}

class _VisualSearchState extends State<VisualSearch> {
  File? searchImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowAppBar(
        leadingIcon: Icons.arrow_back_ios_new_rounded,
        callback: () {},
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black,
                  BlendMode.dst,
                ),
                image: AssetImage(
                  'assets/images/modelimage.png',
                ),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    toHomepageWithBottomBar(context);
                  },
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: white6, decoration: TextDecoration.underline),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 486),
                  child: Text(
                    'Search for an outfit by taking a photo or uploading an image',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 24),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: CustomButton(
                    text: 'TAKE A PHOTO',
                    callback: () async {
                      final ImagePicker picker = ImagePicker();
                      XFile? image =
                          await picker.pickImage(source: ImageSource.camera);
                      print(image?.name);
                      print(image?.path);
                      if (image != null) {
                        setState(() {
                          searchImage = File(image.path);
                          tovisualsearchfinding(context);
                        });
                      }
                    }),
              ),
              CustomButton(
                text: 'UPLOAD AN IMAGE',
                callback: () async {
                  final ImagePicker picker = ImagePicker();
                  XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  print(image?.name);
                  print(image?.path);
                  if (image != null) {
                    setState(() {
                      searchImage = File(image.path);
                      tovisualsearchfinding(context);
                    });
                  }
                },
                btncolor: transparent,
                bordercolor: white6,
                fontcolor: white6,
              )
            ],
          ),
        ),
      ),
    );
  }

  void toHomepageWithBottomBar(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShowBottomBAr()));
  }

  void tovisualsearchfinding(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VisualFinding(searchImage: searchImage)));
  }
}
