import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/Constants/colors.dart';

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
        height: 50,
        width: width*0.9,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.urbanist(
              color: white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
