// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.lableStyle,
    this.hintText,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.title,
    this.onFieldSubmitted,
    this.readOnly,
    this.label,
    this.onTap,
    this.autofocus,
    this.fontWeight,
    this.onChanged,
    this.FocusNode,
    this.maxLines,
    this.from,
  }) : super(key: key);
  final labelText;
  final prefixIcon;
  final suffixIcon;
  final lableStyle;
  final maxLines;
  final hintText;
  final FocusNode;
  final onTap;
  final obscureText;
  final controller;

  final keyboardType;
  final onChanged;
  final title;
  final onFieldSubmitted;
  final readOnly;

  final label;
  final autofocus;
  final fontWeight;
  final from;
  @override
  Widget build(BuildContext context) {
    return from == "update_inventory"
        ? TextFormField(
            onTap: onTap,
            keyboardType: keyboardType,
            cursorWidth: 1.0,
            onChanged: onChanged,
            readOnly: false,
            controller: controller,
            minLines: 1,
            maxLines: maxLines,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: black,
            ),
            decoration: InputDecoration(
              // labelText: "Title",
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              labelStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: secondaryTextColor,
              ),
              hintText: hintText,

              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: secondaryTextColor,
              ),
              contentPadding:
                  EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
              ),

              floatingLabelBehavior: FloatingLabelBehavior.auto,
              isDense: false,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              // height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor.withOpacity(0.05),
              ),
              child: TextFormField(
                onTap: onTap,
                keyboardType: keyboardType,
                cursorWidth: 1.0,
                onChanged: onChanged,
                readOnly: false,
                controller: controller,
                minLines: 1,
                maxLines: maxLines,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
                decoration: InputDecoration(
                  // labelText: "Title",
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: secondaryTextColor,
                  ),
                  hintText: hintText,

                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: secondaryTextColor,
                  ),
                  contentPadding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: primaryColor.withOpacity(0.5)),
                  ),

                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: false,
                ),
              ),
            ),
          );
  }
}
