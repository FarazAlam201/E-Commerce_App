import 'dart:convert';

import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/forgotpasspage.dart';
import 'package:e_commerce_app/screens/visualsearch.dart';
import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:e_commerce_app/widgets/assetButton.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:e_commerce_app/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ShowAppBar(
        leadingIcon: Icons.arrow_back_ios_new_rounded,
        callback: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 14),
              child: Text('Login',
                  style: Theme.of(context).textTheme.displayLarge),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 73, left: 16, right: 16),
                child: ShowTextField(
                  textHint: 'Email',
                  controller: emailcontroller,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: ShowTextField(
                textHint: 'Password',
                moveToNextTextField: TextInputAction.done,
                hiddenData: true,
                controller: passwordcontroller,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 16, right: 4, bottom: 28),
                      child: Text("Forgot your password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: white6))),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          toForgotPassword(context);
                        },
                        icon: Image.asset('assets/images/arrow_right.png'),
                      ),
                    ),
                  )
                ]),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: CustomButton(
                text: "LOGIN",
                callback: () {
                  login(emailcontroller.text, passwordcontroller.text);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 194, bottom: 12),
              child: Center(
                child: Text("Or login with social account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: white6)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetButton(
                  imgpath: 'google',
                  callback: () {},
                ),
                Container(
                  width: 16,
                ),
                AssetButton(
                  imgpath: 'facebook',
                  callback: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void login(String email, password) async {
    http.Response response = await http.put(
        Uri.parse("https://ecommerce.salmanbediya.com/users/login"),
        body: {'email': email, 'password': password});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(jsonData['message']);
      setState(() {
        toVisualSearch();
      });
    } else {
      print("${emailcontroller.text} ${passwordcontroller.text}");
      print(jsonData['error']);
    }
  }

  void toForgotPassword(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
  }

  void toVisualSearch() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => VisualSearch()),
      ModalRoute.withName(''),
    );
  }
}
