import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../raizz_constants/colors.dart';

class CustomButton extends StatelessWidget {
  final text;
  final onTap;
  CustomButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 45,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
