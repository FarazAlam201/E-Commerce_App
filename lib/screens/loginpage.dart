import 'package:e_commerce_app/screens/forgotpasspage.dart';
import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:e_commerce_app/widgets/assetButton.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:e_commerce_app/widgets/textField.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

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
      backgroundColor: Color(0xFF1E1F28),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 14),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFFF6F6F6),
                  fontSize: 34,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 73, left: 16, right: 16),
                child: ShowTextField(
                  textHint: 'Email',
                  controller: _emailcontroller,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: ShowTextField(
                textHint: 'Password',
                moveToNextTextField: TextInputAction.done,
                hiddenData: true,
                controller: _passwordcontroller,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 16, right: 4, bottom: 28),
                      child: Text("Forgot your password?",
                          style: TextStyle(color: Color(0xffF6F6F6)))),
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
              padding: EdgeInsets.only(top: 0, right: 16, left: 16),
              child: CustomButton(
                text: "LOGIN",
                callback: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 194, bottom: 12),
              child: Center(
                child: Text(
                  "Or login with social account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF6F6F6),
                    fontSize: 14,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(24),
                    child: AssetButton(
                      imgpath: 'assets/images/google.png',
                      callback: () {},
                    )),
                Container(
                  width: 16,
                ),
                AssetButton(
                  imgpath: 'assets/images/facebook.png',
                  callback: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void toForgotPassword(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
  }
}
