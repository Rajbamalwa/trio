import 'package:flutter/material.dart';
import 'package:trio/utils/extension/sized_box_extension.dart';
import 'package:trio/utils/raizz_global_widget/CustomText/CustomText.dart';

import '../../../utils/raizz_constants/colors.dart';

class ComplaintWidget extends StatelessWidget {
  final data;
  const ComplaintWidget({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffF7F7F7),
                        backgroundImage: AssetImage(
                          data['image'].toString(),
                        ),
                        radius: 20,
                      ),
                      10.w,
                      SizedBox(
                        width: size.width * 0.12,
                        child: CustomText(
                            data['user'].toString(),
                            black,
                            12,
                            FontWeight.w600,
                            TextOverflow.ellipsis,
                            TextAlign.left),
                      ),
                      SizedBox(
                        width: size.width * 0.2,
                        child: CustomText(
                            data['date'].toString(),
                            grey,
                            9,
                            FontWeight.w500,
                            TextOverflow.ellipsis,
                            TextAlign.left),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomText(
                        data['type'].toString(),
                        primaryColor,
                        10,
                        FontWeight.w600,
                        TextOverflow.ellipsis,
                        TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
                child: CustomText(
                  data['detail'].toString(),
                  grey,
                  10,
                  FontWeight.w500,
                  TextOverflow.clip,
                  TextAlign.left,
                ),
              ),
              5.h,
              Row(
                children: [
                  10.w,
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.check,
                      color: primaryColor,
                    ),
                  ),
                  10.w,
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.clear,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
