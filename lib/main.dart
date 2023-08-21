import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          splashColor: transparent,
          highlightColor: transparent,
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: transparent,
              titleTextStyle:
                  GoogleFonts.metrophobic(fontSize: 18, color: white6)),
          textTheme: TextTheme(
            displayLarge: GoogleFonts.metrophobic(
                fontSize: 34, color: white6, fontWeight: FontWeight.w900),
            displaySmall: GoogleFonts.metrophobic(
                fontSize: 11, color: grey1, fontWeight: FontWeight.w400),
            bodyMedium: GoogleFonts.metrophobic(
                fontSize: 16, color: white6, fontWeight: FontWeight.w400),
            bodySmall: GoogleFonts.metrophobic(fontSize: 14, color: white5),
          ),
          inputDecorationTheme: InputDecorationTheme(
              suffixIconColor: greyHintText,
              filled: true,
              fillColor: greyLightTextField,
              iconColor: greyHintText,
              labelStyle:
                  GoogleFonts.metrophobic(fontSize: 11, color: greyLabelText),
              hintStyle:
                  GoogleFonts.metrophobic(fontSize: 14, color: greyHintText),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    color: greyLightTextField,
                  )),
              enabledBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide:
                    BorderSide(color: greyLightTextField.withOpacity(0.50)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: errorColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: errorColor),
              )),
          scaffoldBackgroundColor: screenBgcolor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: bottomBarBgcolor.withOpacity(0.2),
            selectedLabelStyle: TextStyle(color: redButton),
            unselectedLabelStyle: TextStyle(color: grey1),
            selectedItemColor: redButton,
            unselectedItemColor: grey1,
          )),
      home: const Signuppage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
