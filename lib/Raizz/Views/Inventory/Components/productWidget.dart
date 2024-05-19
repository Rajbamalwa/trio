import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trio/Raizz/Views/Inventory/InventoryUpdateScreen.dart';
import 'package:trio/Raizz/Widgets/CustomText/CustomText.dart';

import '../../../Constants/colors.dart';

class ProductWidget extends StatelessWidget {
  final data;
  const ProductWidget({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              data['image'].toString(),
              scale: 4,
            ),
            title: CustomText(
              data['title'].toString(),
              black,
              14,
              FontWeight.w700,
              TextOverflow.ellipsis,
              TextAlign.left,
            ),
            subtitle: CustomText(
              "${data['unit']} Units",
              secondaryTextColor,
              10,
              FontWeight.w600,
              TextOverflow.ellipsis,
              TextAlign.left,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  data['date'],
                  grey,
                  10,
                  FontWeight.w500,
                  TextOverflow.ellipsis,
                  TextAlign.left,
                ),
                SizedBox(
                  width: width * 0.24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        "Category: ",
                        secondaryTextColor,
                        10,
                        FontWeight.w600,
                        TextOverflow.ellipsis,
                        TextAlign.left,
                      ),
                      CustomText(
                        data['category'],
                        secondaryTextColor,
                        10,
                        FontWeight.w800,
                        TextOverflow.ellipsis,
                        TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14,
              right: 14,
            ),
            child: Divider(),
          ),
          ListTile(
            onTap: () {
              Get.to(InventoryUpdateScreen(
                data: data,
              ));
            },
            title: CustomText(
              "MRP: ₹${data['price']}",
              black,
              16,
              FontWeight.w700,
              TextOverflow.ellipsis,
              TextAlign.left,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_drop_up,
                  color: green,
                ),
                CustomText(
                  "Cost price: ₹ ${data['cost_price']}",
                  green,
                  12,
                  FontWeight.w500,
                  TextOverflow.ellipsis,
                  TextAlign.left,
                ),
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: black,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
