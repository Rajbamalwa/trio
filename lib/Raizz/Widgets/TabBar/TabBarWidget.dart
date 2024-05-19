import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';

class TabBarMenu extends StatelessWidget {
  const TabBarMenu({
    Key? key,
    required this.tabTitle,
    required this.onTap,
  }) : super(key: key);
  final Function(int) onTap;
  final List<String> tabTitle;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: white,
      unselectedLabelColor: grey,
      labelStyle: GoogleFonts.poppins(
        color: white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        color: secondaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      dividerColor: transparent,
      indicatorWeight: 0,
      indicatorColor: primaryColor,
      onTap: onTap,
      isScrollable: false,
      indicator: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: List.generate(
        tabTitle.length,
        (index) => Tab(
          text: tabTitle[index],
        ),
      ),
    );
  }
}
