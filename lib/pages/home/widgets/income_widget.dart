import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/utils/extension/sized_box_extension.dart';

import '../../../Constants/colors.dart';
import '../../../utils/raizz_global_widget/CustomText/CustomText.dart';
import '../controller/home_controller.dart';

List services_item = [
  {
    "service_name": "Hair Salon",
    "service_revenue": 15000,
    "service_expense": 15000,
    "service_percent": 10,
  },
  {
    "service_name": "Makeup",
    "service_revenue": 15000,
    "service_expense": 15000,
    "service_percent": 20,
  },
  {
    "service_name": "Makeup",
    "service_revenue": 15000,
    "service_expense": 15000,
    "service_percent": 30,
  },
  {
    "service_name": "Makeup",
    "service_revenue": 15000,
    "service_expense": 15000,
    "service_percent": 40,
  },
  {
    "service_name": "Makeup",
    "service_revenue": 15000,
    "service_expense": 15000,
    "service_percent": 50,
  },
  {
    "service_name": "Makeup",
    "service_revenue": 15000,
    "service_expense": 15000,
    "service_percent": 60,
  },
  {
    "service_name": "Makeup",
    "service_revenue": 15000,
    "service_expense": 15000,
    "service_percent": 70,
  }
];

class IncomeWidget extends StatefulWidget {
  final from;
  const IncomeWidget({super.key, this.from});

  @override
  State<IncomeWidget> createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  int touchedIndex = -1;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: grey.withOpacity(0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 10,
                      color: primaryColor,
                    ),
                    10.w,
                    SizedBox(
                      width: size.width * 0.8,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.from == "Expense"
                                  ? "Total Expense "
                                  : 'Total Income ',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: widget.from == "Expense"
                                  ? "₹5000"
                                  : '₹35,067',
                              style: GoogleFonts.poppins(
                                color: primaryColor,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                10.h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 10,
                      color: primaryColor,
                    ),
                    10.w,
                    SizedBox(
                      width: size.width * 0.8,
                      child: CustomText(
                        widget.from == "Expense"
                            ? "Expense per Service "
                            : "Revenue per Service",
                        black,
                        20,
                        FontWeight.w600,
                        TextOverflow.clip,
                        TextAlign.start,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: services_item.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 30),
                          child: SizedBox(
                            width: size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  services_item[index]['service_name']
                                      .toString(),
                                  black,
                                  12,
                                  FontWeight.w500,
                                  TextOverflow.clip,
                                  TextAlign.start,
                                ),
                                CustomText(
                                  widget.from == "Expense"
                                      ? services_item[index]['service_expense']
                                          .toString()
                                      : services_item[index]['service_revenue']
                                          .toString(),
                                  primaryColor,
                                  12,
                                  FontWeight.w500,
                                  TextOverflow.clip,
                                  TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 30),
                          child: CustomText(
                            "|\n|----",
                            primaryColor,
                            4,
                            FontWeight.w600,
                            TextOverflow.clip,
                            TextAlign.start,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                30.h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 10,
                      color: primaryColor,
                    ),
                    10.w,
                    SizedBox(
                      width: size.width * 0.8,
                      child: CustomText(
                        "Graph Statistics",
                        black,
                        20,
                        FontWeight.w600,
                        TextOverflow.clip,
                        TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.3,
                          width: size.width * 0.4,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 10,
                                sections: showingSections(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.3,
                          width: size.width * 0.42,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: services_item.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    // Parse the service_percent value and adjust opacity
                                    final percentString = services_item[index]
                                            ['service_percent']
                                        .toString();
                                    final value =
                                        double.tryParse(percentString) ?? 0.0;

                                    // Ensure the percentString is correctly formatted for opacity calculation
                                    final opacity =
                                        (value / 100).clamp(0.0, 1.0);

                                    // Apply opacity to primaryColor
                                    final sectionColor =
                                        primaryColor.withOpacity(opacity);

                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.1,
                                            child: Divider(
                                              color: black,
                                              thickness: 1.5,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                "${services_item[index]['service_percent']}%",
                                                black,
                                                10,
                                                FontWeight.w400,
                                                TextOverflow.clip,
                                                TextAlign.start,
                                              ),
                                              5.w,
                                              Container(
                                                height: 20,
                                                width: 20,
                                                color: sectionColor,
                                              ),
                                              5.w,
                                              SizedBox(
                                                width: size.width * 0.15,
                                                child: CustomText(
                                                  services_item[index]
                                                          ['service_name']
                                                      .toString(),
                                                  black,
                                                  10,
                                                  FontWeight.w400,
                                                  TextOverflow.ellipsis,
                                                  TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                30.h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 10,
                          color: primaryColor,
                        ),
                        10.w,
                        SizedBox(
                          width: size.width * 0.40,
                          child: CustomText(
                            "Target Income",
                            black,
                            20,
                            FontWeight.w600,
                            TextOverflow.clip,
                            TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: CustomText(
                        "₹44,500",
                        primaryColor,
                        20,
                        FontWeight.w600,
                        TextOverflow.clip,
                        TextAlign.right,
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: size.width * 0.8,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "₹${homeController.sliderValue.value.toStringAsFixed(0)}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '/₹44,500',
                              style: GoogleFonts.poppins(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                Obx(() {
                  return Slider(
                    value: homeController.sliderValue.value,
                    min: 1.0,
                    max: 44500,
                    activeColor: primaryColor, // Change the active color
                    inactiveColor: primaryColor
                        .withOpacity(0.2), // Change the inactive color
                    thumbColor: primaryColor, // Change the thumb color

                    onChanged: (value) {
                      setState(() {
                        homeController.sliderValue.value = value;
                      });
                    },
                  );
                }),
                100.h,
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(services_item.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      // Parse the service_percent value and adjust opacity
      final percentString = services_item[i]['service_percent'].toString();
      final value = double.tryParse(percentString) ?? 0.0;

      // Ensure the percentString is correctly formatted for opacity calculation
      final opacity = (value / 100).clamp(0.0, 1.0);

      // Apply opacity to primaryColor
      final sectionColor = primaryColor.withOpacity(opacity);
      return PieChartSectionData(
        color: sectionColor, // Set the section color with dynamic opacity
        value: double.tryParse(services_item[i]['service_percent'].toString()),
        title: '',
        radius: radius,
        titleStyle: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: black,
          shadows: shadows,
        ),
      );
    });
  }
}

// Widget IncomeWidget(width) {
//   return
// }
