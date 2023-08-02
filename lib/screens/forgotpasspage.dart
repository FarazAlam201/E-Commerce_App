import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:e_commerce_app/widgets/textField.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                "Forgot password",
                style: TextStyle(
                  color: Color(0xFFF6F6F6),
                  fontSize: 34,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 87, left: 15),
              child: Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: TextStyle(
                    color: Color(0xFFF6F6F6),
                    fontSize: 14,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: ShowTextField(
                  textHint: 'Email',
                )),
            Padding(
              padding: EdgeInsets.only(top: 70, right: 16, left: 16),
              child: CustomButton(
                text: "SEND",
                callback: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
