import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BioPage extends StatefulWidget {
  const BioPage({Key? key}) : super(key: key);

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  int _value = 0;
  final title6 = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  final text1 = TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold);
  final visibleText = TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
  bool firstValue = false;

  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 60,
            height: 60,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset("assets/icons/icon8.pnp"),
          ),
          const SizedBox(
            height: 15,
          ),
        Text(
  "Write a short bio about yourself",
  style: GoogleFonts.manrope(
    textStyle: title6.copyWith(fontSize: 20), // Adjust the font size
  ),
      ),

          const SizedBox(
            height: 20,
          ),

          // Bio Input Box
// Bio Input Box
TextField(
  controller: bioController,
  maxLines: 5,
  decoration: InputDecoration(
    hintText: "My name is ...",
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Color(0xFFD4356E)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Color(0xFFD4356E)),
    ),
    contentPadding: EdgeInsets.all(10.0),
  ),
),

          const SizedBox(
            height: 40,
          ),
          // Other Widgets...
        ],
      ),
    );
  }
}
