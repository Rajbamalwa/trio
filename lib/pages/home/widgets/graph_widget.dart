import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/utils/extension/sized_box_extension.dart';

import '../../../utils/raizz_constants/colors.dart';
import '../../../utils/raizz_global_widget/CustomText/CustomText.dart';

class GraphWidget extends StatelessWidget {
  final services_item;
  GraphWidget({super.key, this.services_item});
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 20,
                sections: showingSections(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.2,
          width: size.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: services_item.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    // Parse the service_percent value and adjust opacity
                    final percentString =
                        services_item[index]['service_percent'].toString();
                    final value = double.tryParse(percentString) ?? 0.0;

                    // Ensure the percentString is correctly formatted for opacity calculation
                    final opacity = (value / 100).clamp(0.0, 1.0);

                    // Apply opacity to primaryColor
                    final sectionColor = primaryColor.withOpacity(opacity);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              services_item[index]['service_name'].toString(),
                              black,
                              10,
                              FontWeight.w400,
                              TextOverflow.ellipsis,
                              TextAlign.start,
                            ),
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
