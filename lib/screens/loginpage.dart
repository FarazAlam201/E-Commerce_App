import 'package:e_commerce_app/screens/forgotpasspage.dart';
import 'package:e_commerce_app/widgets/assetButton.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:e_commerce_app/widgets/textField.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E1F28),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      backgroundColor: Color(0xFF1E1F28),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
              padding: EdgeInsets.only(top: 73, left: 16, right: 16),
              child: ShowTextField(
                textHint: 'Email',
              )),
          Padding(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: ShowTextField(
                textHint: 'Password',
                hiddenData: true,
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 16, right: 4, bottom: 28),
                    child: Text("Forgot your password?",
                        style: TextStyle(color: const Color(0xffF6F6F6)))),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Container(
                      child: IconButton(
                        onPressed: () {
                          toForgotPassword(context);
                        },
                        icon: Image.asset('assets/image/arrow_right.png'),
                      ),
                    ),
                  ),
                )
              ]),
          Padding(
            padding: EdgeInsets.only(top: 0, right: 16, left: 16),
            child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(25),
                child: CustomButton(text: "LOGIN")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 194, bottom: 12),
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
                  )),
              Container(
                width: 16,
              ),
              InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(24),
                  child: AssetButton(
                    imgpath: 'assets/images/facebook.png',
                  ))
            ],
          )
        ],
      ),
    );
  }

  void toForgotPassword(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
  }
}
