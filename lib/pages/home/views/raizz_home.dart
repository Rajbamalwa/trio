import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/colors.dart';
import '../../../utils/raizz_constants/string_constants.dart';
import '../../../utils/raizz_global_widget/CustomText/CustomText.dart';
import '../../../utils/raizz_global_widget/DropDownButton/DropDownButtonWidget.dart';
import '../../../utils/raizz_global_widget/TabBar/TabBarWidget.dart';
import '../widgets/calender_widget.dart';
import '../widgets/income_widget.dart';

class RaizHomeScreen extends StatefulWidget {
  const RaizHomeScreen({super.key});

  @override
  State<RaizHomeScreen> createState() => _RaizHomeScreenState();
}

class _RaizHomeScreenState extends State<RaizHomeScreen> {
  String _selectedValue = "Item 1";
  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String _selectedDate = "Today";

  int touchedIndex = -1;
  double _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: CustomText(
          "Raizz",
          black,
          16,
          FontWeight.w600,
          TextOverflow.clip,
          TextAlign.center,
        ),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: black,
            ),
          )
        ],
      ),
      // drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
                top: size.height * 0.02,
                bottom: size.height * 0.02),
            child: SizedBox(
              height: 40,
              child: CustomDropdownField(
                labelText: "Select shop",
                items: _dropdownItems,
                value: _selectedValue,
                Hint: "Select shop",
                onChanged: (value) {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date Range: ",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.all(10),
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: transparent,
                          elevation: 0,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 40,
                              child: CustomDropdownField(
                                labelText: "Select date",
                                items: DATE_ITEM,
                                value: _selectedDate,
                                Hint: "Select date",
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          content:
                              StatefulBuilder(builder: (context, setState) {
                            return CalenderWidget();
                          }),
                        );
                      },
                    );
                  },
                  child: CustomText(
                    "Last 30 Days",
                    primaryColor,
                    12,
                    FontWeight.w400,
                    TextOverflow.clip,
                    TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: secondaryTextColor.withOpacity(0.1),
                      ),
                      child: TabBarMenu(
                        tabTitle: const ["Income", "Expense"],
                        onTap: (int i) {},
                      ),
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      physics: ScrollPhysics(),
                      children: [
                        IncomeWidget(
                          from: "Income",
                        ),
                        IncomeWidget(
                          from: "Expense",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
