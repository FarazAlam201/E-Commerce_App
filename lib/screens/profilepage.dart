import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/myorders.dart';
import 'package:e_commerce_app/screens/settings.dart';
import 'package:e_commerce_app/widgets/profileTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: transparent, actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 14),
          child: Text("My profile",
              style: GoogleFonts.metrophobic(
                  color: white6, fontSize: 34, fontWeight: FontWeight.w700)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 17, top: 24, right: 18, bottom: 28),
              child: CircleAvatar(
                radius: 32,
                child: Image.asset("assets/images/ava.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Matilda Brown",
                    style: GoogleFonts.metrophobic(
                        color: white6,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.22)),
                Text("matildabrown@mail.com",
                    style: GoogleFonts.metrophobic(
                        color: const Color(0xFFABB4BD),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.43))
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileTile(
                title: const Text("My orders"),
                subtitle: const Text("Already have 12 orders"),
                callback: () {
                  _toMyOrdersPage(context);
                },
              ),
              const ProfileTile(
                title: Text("Shipping addresses"),
                subtitle: Text("3 addresses"),
              ),
              const ProfileTile(
                title: Text("Payment methods"),
                subtitle: Text("Visa  **34"),
              ),
              const ProfileTile(
                title: Text("Promocodes"),
                subtitle: Text("You have special promocodes"),
              ),
              const ProfileTile(
                title: Text("My reviews"),
                subtitle: Text("Reviews for 4 items"),
              ),
              ProfileTile(
                title: const Text("Settings"),
                subtitle: const Text("Notifications, password"),
                callback: () => _toSettingsPage(context),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void _toMyOrdersPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyOrders()));
  }

  void _toSettingsPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Settings()));
  }
}
