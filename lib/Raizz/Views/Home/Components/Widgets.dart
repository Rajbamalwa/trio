import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/CustomText/CustomText.dart';

class IncomeWidget extends StatefulWidget {
  final from;
  const IncomeWidget({super.key, this.from});

  @override
  State<IncomeWidget> createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  int touchedIndex = -1;
  double _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: grey.withOpacity(0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 16, top: 16),
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
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: width * 0.8,
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
                            text:
                                widget.from == "Expense" ? "₹5000" : '₹35,067',
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
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 10,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: width * 0.8,
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
              Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 30),
                        child: SizedBox(
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                "Hair salon",
                                black,
                                12,
                                FontWeight.w500,
                                TextOverflow.clip,
                                TextAlign.start,
                              ),
                              CustomText(
                                "₹ 15,000",
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
                        padding: const EdgeInsets.only(left: 40, right: 30),
                        child: SizedBox(
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                "Makeup",
                                black,
                                12,
                                FontWeight.w500,
                                TextOverflow.clip,
                                TextAlign.start,
                              ),
                              CustomText(
                                "₹ 15,000",
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: CustomText(
                      "|\n|-----\n|\n|\n|-----",
                      primaryColor,
                      4,
                      FontWeight.w600,
                      TextOverflow.clip,
                      TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 10,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: width * 0.8,
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
                      Flexible(
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: CustomText(
                                  "30%",
                                  black,
                                  10,
                                  FontWeight.w400,
                                  TextOverflow.clip,
                                  TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                color: primaryColor.withOpacity(0.3),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: width * 0.2,
                                child: CustomText(
                                  "Hair salon",
                                  black,
                                  10,
                                  FontWeight.w400,
                                  TextOverflow.clip,
                                  TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: CustomText(
                                  "70%",
                                  black,
                                  10,
                                  FontWeight.w400,
                                  TextOverflow.clip,
                                  TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: width * 0.2,
                                child: CustomText(
                                  "Makeup",
                                  black,
                                  10,
                                  FontWeight.w400,
                                  TextOverflow.clip,
                                  TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    top: 70,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                          width: width * 0.17,
                          child: Divider(
                            color: black,
                            thickness: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: width * 0.17,
                          child: Divider(
                            color: black,
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
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
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: width * 0.40,
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
                    width: width * 0.4,
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
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: width * 0.8,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '₹35,067',
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
              ),
              Slider(
                value: _currentValue,
                min: 1,
                max: 20,
                activeColor: primaryColor, // Change the active color
                inactiveColor:
                    primaryColor.withOpacity(0.2), // Change the inactive color
                thumbColor: primaryColor, // Change the thumb color

                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: primaryColor,
            value: 70,
            title: '',
            radius: radius,
            titleStyle: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: black,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: primaryColor.withOpacity(0.3),
            value: 30,
            title: '',
            radius: radius,
            titleStyle: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: black,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

// Widget IncomeWidget(width) {
//   return
// }
