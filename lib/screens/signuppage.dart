import 'dart:convert';
import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/loginpage.dart';
import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:e_commerce_app/widgets/assetButton.dart';
import 'package:e_commerce_app/widgets/customButton.dart';
import 'package:e_commerce_app/widgets/textField.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _emailformKey = GlobalKey<FormState>();
  final _passwordformKey = GlobalKey<FormState>();
  final _nameformkey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool shouldAutoValidateName = false;
  bool shouldAutoValidateEmail = false;
  bool shouldAutoValidatePassword = false;

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
              child: Text(
                'Sign up',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Form(
                    key: _nameformkey,
                    autovalidateMode: shouldAutoValidateName
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: ShowTextField(
                      textHint: 'Name',
                      controller: namecontroller,
                      onFieldSubmitted: (p0) {
                        setState(() {
                          shouldAutoValidateName = true;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        } else if (value.length < 3) {
                          return 'This field requires a minimum of 3 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Form(
                    key: _emailformKey,
                    autovalidateMode: shouldAutoValidateEmail
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ShowTextField(
                        textHint: 'Email',
                        controller: emailcontroller,
                        onFieldSubmitted: (p0) {
                          setState(() {
                            shouldAutoValidateEmail = true;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field is required';
                          } else if (!value.contains('@gmail.com')) {
                            return 'Not a valid email address. Should be your@email.com';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Form(
                    key: _passwordformKey,
                    autovalidateMode: shouldAutoValidatePassword
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: ShowTextField(
                      textHint: 'Password',
                      hiddenData: true,
                      moveToNextTextField: TextInputAction.done,
                      controller: passwordcontroller,
                      onFieldSubmitted: (p0) {
                        setState(() {
                          shouldAutoValidatePassword = true;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        } else if (value.trim().length < 6) {
                          return 'Password must require a minimum of 6 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, right: 4, bottom: 28),
                        child: Text(
                          'Already have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: white6),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          toLoginPage(context);
                        },
                        child: Image.asset('assets/images/arrow_right.png'),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'SIGN UP',
                    callback: () {
                      var test = _nameformkey.currentState!.validate();
                      var test1 = _emailformKey.currentState!.validate();
                      var test2 = _passwordformKey.currentState!.validate();
                      print("$test $test1 $test2");
                      if (test && test1 && test2) {
                        signup(namecontroller.text, emailcontroller.text,
                            passwordcontroller.text);
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 126, bottom: 12, left: 85, right: 85),
              child: Center(
                child: Text(
                  'Or sign up with social account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: white6),
                ),
              ),
            ),
            const ShowAssetButton(),
          ],
        ),
      ),
    );
  }

  void signup(String name, String email, String password) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: CircularProgressIndicator(
          color: redButton,
        ));
      },
    );

    http.Response response = await http.post(
      Uri.parse('https://ecommerce.salmanbediya.com/users/register'),
      body: {'name': name, 'email': email, 'password': password},
    );
    Navigator.of(context).pop();
    var data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      _showToast(data['message']);
      namecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
      setState(() {
        toLoginPage(context);
      });
    } else if (response.statusCode == 400) {
      _showToast(data['email'].toString());
      print(response.body);
      print(response.statusCode);
      emailcontroller.clear();
      passwordcontroller.clear();
    } else {
      _showToast('Please check your internet connection and try again');
    }
  }

  _showToast(String msg) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: screenBgcolor.withOpacity(0.8),
      textColor: white,
      fontSize: 16.0,
    );
  }

  void toLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Loginpage()));
  }
}
