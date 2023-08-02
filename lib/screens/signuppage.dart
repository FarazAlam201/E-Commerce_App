import 'package:e_commerce_app/screens/loginpage.dart';
import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:e_commerce_app/widgets/assetButton.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:e_commerce_app/widgets/textField.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ShowAppBar(
        leadingIcon: Icons.arrow_back_ios_new_rounded,
        callback: () {},
      ),
      backgroundColor: Color(0xff1E1F28),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 18, left: 14, bottom: 73),
                child: Text("Sign up",
                    style: TextStyle(
                        color: Color(0xFFF6F6F6),
                        fontSize: 34,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w700))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ShowTextField(
                  textHint: "Name",
                  controller: _namecontroller,
                )),
            Padding(
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                child: ShowTextField(
                  textHint: "Email",
                  controller: _emailcontroller,
                )),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: ShowTextField(
                textHint: "Password",
                hiddenData: true,
                moveToNextTextField: TextInputAction.done,
                controller: _passwordcontroller,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 16, right: 4, bottom: 28),
                      child: Text("Already have an account?",
                          style: TextStyle(color: Color(0xffF6F6F6)))),
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
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  text: "SIGN UP",
                  callback: () {},
                )),
            const Padding(
              padding:
                  EdgeInsets.only(top: 126, bottom: 12, left: 85, right: 85),
              child: Center(
                child: Text(
                  "Or sign up with social account",
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
                InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(24),
                    child: AssetButton(
                      imgpath: 'assets/images/facebook.png',
                      callback: () {},
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void toLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Loginpage()));
  }
}
