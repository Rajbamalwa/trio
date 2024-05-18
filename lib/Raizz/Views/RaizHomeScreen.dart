import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/Raizz/Views/Components/TableCalenderWidget.dart';
import 'package:trio/Raizz/Widgets/CustomText/CustomText.dart';
import 'package:trio/Raizz/Widgets/DropDownButton/DropDownButtonWidget.dart';

import '../Constants/colors.dart';
import '../Widgets/TabBar/TabBarWidget.dart';
import 'Components/Widgets.dart';

class RaizHomeScreen extends StatefulWidget {
  const RaizHomeScreen({super.key});

  @override
  State<RaizHomeScreen> createState() => _RaizHomeScreenState();
}

class _RaizHomeScreenState extends State<RaizHomeScreen> {
  String _selectedValue = "Item 1";
  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  int touchedIndex = -1;
  double _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 10),
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
                          elevation: 0,
                          content:
                              StatefulBuilder(builder: (context, setState) {
                            return CalenderWidget();
                          }),
                          // actions: [
                          //   TextButton(
                          //     onPressed: () {
                          //       Navigator.of(context).pop();
                          //     },
                          //     child: Text('OK'),
                          //   ),
                          // ],
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
                        SingleChildScrollView(
                            child: IncomeWidget(
                          from: "Income",
                        )),
                        SingleChildScrollView(
                            child: IncomeWidget(
                          from: "Expense",
                        )),
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
