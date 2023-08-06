import 'dart:convert';

import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/loginpage.dart';
import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:e_commerce_app/widgets/assetButton.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:e_commerce_app/widgets/textField.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ShowAppBar(
        leadingIcon: Icons.arrow_back_ios_new_rounded,
        callback: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 18, left: 14, bottom: 73),
                child: Text("Sign up",
                    style: Theme.of(context).textTheme.displayLarge)),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ShowTextField(
                  textHint: "Name",
                  controller: namecontroller,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                child: ShowTextField(
                  textHint: "Email",
                  controller: emailcontroller,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: ShowTextField(
                textHint: "Password",
                hiddenData: true,
                moveToNextTextField: TextInputAction.done,
                controller: passwordcontroller,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                  padding: const EdgeInsets.only(top: 16, right: 4, bottom: 28),
                  child: Text("Already have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: white6))),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      toLoginPage(context);
                    },
                    icon: Image.asset('assets/images/arrow_right.png'),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: "SIGN UP",
                callback: () {
                  signup(namecontroller.text, emailcontroller.text,
                      emailcontroller.text);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 126, bottom: 12, left: 85, right: 85),
              child: Center(
                child: Text("Or sign up with social account",
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
                InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(24),
                    child: AssetButton(
                      imgpath: 'google',
                      callback: () {},
                    )),
                Container(
                  width: 16,
                ),
                InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(24),
                    child: AssetButton(
                      imgpath: 'facebook',
                      callback: () {},
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void signup(String name, String email, String password) async {
    http.Response response = await http.post(
        Uri.parse("https://ecommerce.salmanbediya.com/users/register"),
        body: {'name': name, 'email': email, 'password': password});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 201) {
      print(jsonData['message']);
      namecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
      //print('Success');
    } else if (response.statusCode == 400) {
      jsonData['email'];
      print(response.body);
      print(response.statusCode);
      emailcontroller.clear();
      passwordcontroller.clear();
    } else {
      print('please check your internet connection');
    }
  }

  void toLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Loginpage()));
  }
}
