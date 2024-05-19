import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/Raizz/Views/Inventory/Components/productWidget.dart';
import 'package:trio/Raizz/Views/Profile/ProfileScreen.dart';

import '../../Constants/colors.dart';
import '../../Widgets/CustomText/CustomText.dart';
import '../../Widgets/DropDownButton/DropDownButtonWidget.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List inventoryList = [
    {
      "title": "Loreal Shampoo",
      "image": "assets/images/product.png",
      "category": "Hair",
      "unit": "50",
      "price": "200",
      "cost_price": "175",
      "date": "2 March, 2024",
    },
    {
      "title": "Loreal Shampoo",
      "image": "assets/images/product.png",
      "category": "Hair",
      "unit": "50",
      "price": "200",
      "cost_price": "175",
      "date": "2 March, 2024",
    }
  ];
  String _selectedSort = "Cost Price";

  final List<String> _sortItems = [
    'Cost Price',
    'Category',
    'Units Left',
  ];

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
            onPressed: () {
              Get.to(ProfileScreen());
            },
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 10,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: width * 0.5,
                      child: CustomText("Inventory", black, 32, FontWeight.w500,
                          TextOverflow.clip, TextAlign.left)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      "Sort by: ",
                      black,
                      12,
                      FontWeight.w400,
                      TextOverflow.clip,
                      TextAlign.start,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Stack(
                              children: <Widget>[
                                Positioned(
                                  left:
                                      0.0, // Change these values to position the dialog
                                  right: 0.0,
                                  top:
                                      50.0, // Change these values to position the dialog
                                  child: AlertDialog(
                                    insetPadding: EdgeInsets.all(10),
                                    contentPadding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    backgroundColor: transparent,
                                    elevation: 0,
                                    title: Container(
                                      height: 100,
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            right: 10,
                                            left: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          height: 40,
                                          child: CustomDropdownField(
                                            labelText: "Select date",
                                            items: _sortItems,
                                            value: _selectedSort,
                                            Hint: "Select date",
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedSort = value;
                                              });
                                              Get.back();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    // content:
                                    // StatefulBuilder(builder: (context, setState) {
                                    //   return CalenderWidget();
                                    // }),
                                    // actions: [
                                    //   TextButton(
                                    //     onPressed: () {
                                    //       Navigator.of(context).pop();
                                    //     },
                                    //     child: Text('OK'),
                                    //   ),
                                    // ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        _selectedSort.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          inventoryList.isEmpty
              ? SizedBox()
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: inventoryList.length,
                    padding: EdgeInsets.only(top: 14, left: 14, right: 14),
                    itemBuilder: (context, index) {
                      var data = inventoryList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ProductWidget(data: data),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
