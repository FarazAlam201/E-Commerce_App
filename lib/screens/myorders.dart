import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/orderdetails.dart';
import 'package:e_commerce_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowAppBar(
        callback: () {
          Navigator.pop(context);
        },
        leadingIcon: Icons.arrow_back_ios_new_rounded,
        actionIcon: Icons.search,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 14, bottom: 24),
          child: Text("My Orders",
              style: GoogleFonts.metrophobic(
                  color: white6, fontSize: 34, fontWeight: FontWeight.w700)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _showTab(
                  nametext: "Delivered",
                  color: white6,
                  textStyle:
                      GoogleFonts.metrophobic(color: greyLightTextField)),
              _showTab(
                  nametext: "Processing",
                  textStyle: GoogleFonts.metrophobic(color: white6)),
              _showTab(
                nametext: "Cancelled",
                textStyle: GoogleFonts.metrophobic(color: white6),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                _orderCards(),
                _orderCards(),
                _orderCards(),
                _orderCards(),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget _showTab(
      {required String nametext,
      Color color = Colors.transparent,
      required TextStyle textStyle}) {
    return InkWell(
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(29)),
        child: Center(child: Text(nametext, style: textStyle)),
      ),
    );
  }

  Widget _orderCards() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        width: 343,
        height: 164,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: greyLightTextField),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 19),
              child: Row(
                children: [
                  Text(
                    "Order №1947034",
                    style: GoogleFonts.metrophobic(fontSize: 16, color: white6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 97),
                    child: Text(
                      "05-12-2019",
                      style: GoogleFonts.metrophobic(
                          color: greyHintText, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 4, left: 18),
              child: Row(
                children: [
                  Text(
                    "Tracking number:",
                    style: GoogleFonts.metrophobic(
                        fontSize: 14, color: greyHintText),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "IW3475453455",
                      style: GoogleFonts.metrophobic(
                          fontSize: 14,
                          color: white6,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Row(
                children: [
                  Text(
                    "Quantity:",
                    style: GoogleFonts.metrophobic(
                        fontSize: 14,
                        color: greyHintText,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 11),
                    child: Text(
                      "3",
                      style: GoogleFonts.metrophobic(
                          color: white6,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 86),
                    child: Text("Total Amount:",
                        style: GoogleFonts.metrophobic(
                            fontSize: 14,
                            color: greyHintText,
                            fontWeight: FontWeight.w400)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 11),
                    child: Text(
                      "112",
                      style: GoogleFonts.metrophobic(
                          color: white6,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19, top: 17),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _toOrderDetailsPage(context);
                    },
                    child: Container(
                      width: 98,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(width: 0.50, color: white6)),
                      child: Center(
                          child: Text(
                        "Details",
                        style: GoogleFonts.metrophobic(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: white6),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 137),
                    child: Text(
                      "Delivered",
                      style: GoogleFonts.metrophobic(
                          color: green2,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _toOrderDetailsPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const OrderDetails()));
  }
}
