import 'package:flutter/material.dart';

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
      labelColor: primaryColor,
      unselectedLabelColor: grey,
      labelStyle: TextStyle(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
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
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: List.generate(
          tabTitle.length,
          (index) => Tab(
                text: tabTitle[index],
              )),
    );
  }
}
