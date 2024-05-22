import 'package:flutter/material.dart';

import '../../../utils/raizz_constants/colors.dart';
import '../../../utils/raizz_global_widget/CustomText/CustomText.dart';

class ServiceWidget extends StatelessWidget {
  final data;
  const ServiceWidget({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0xffF7F7F7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      child: CustomText(
                          data['service'].toString(),
                          black,
                          14,
                          FontWeight.w700,
                          TextOverflow.ellipsis,
                          TextAlign.left),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: CustomText(
                          "by: ${data['by']}",
                          secondaryTextColor,
                          10,
                          FontWeight.w500,
                          TextOverflow.ellipsis,
                          TextAlign.end),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      child: CustomText(
                          data['date'].toString(),
                          grey.withOpacity(0.7),
                          10,
                          FontWeight.w500,
                          TextOverflow.ellipsis,
                          TextAlign.left),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: CustomText(
                        "Category: ${data['category']}",
                        grey,
                        10,
                        FontWeight.w700,
                        TextOverflow.ellipsis,
                        TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Divider(
                    color: secondaryTextColor,
                    thickness: 0.5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText("MRP: ₹${data['mrp'].toString()}", green, 16,
                        FontWeight.w600, TextOverflow.ellipsis, TextAlign.left),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.navigate_next_sharp,
                        color: grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
