import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/utils/extension/sized_box_extension.dart';

import '../../../utils/raizz_constants/colors.dart';
import '../../../utils/raizz_global_widget/CustomText/CustomText.dart';
import '../widget/complaint_widget.dart';

List complaintItems = [
  {
    "image": "assets/images/user.png",
    "user": "User1",
    "type": "Publish",
    "detail":
        "Lorem ipsum dolor sit amet consectetur. In rmodo nibhe congue in dictum maurisrer qwer retwe.",
    "date": "2 weeks ago",
  },
  {
    "image": "assets/images/user.png",
    "user": "User1",
    "type": "Publish",
    "detail":
        "Lorem ipsum dolor sit amet consectetur. In rmodo nibhe congue in dictum maurisrer qwer retwe.",
    "date": "2 weeks ago",
  },
  {
    "image": "assets/images/user.png",
    "user": "User1",
    "type": "Publish",
    "detail":
        "Lorem ipsum dolor sit amet consectetur. In rmodo nibhe congue in dictum maurisrer qwer retwe.",
    "date": "2 weeks ago",
  },
];

class RaizzComplaintScreen extends StatefulWidget {
  const RaizzComplaintScreen({super.key});

  @override
  State<RaizzComplaintScreen> createState() => _RaizzComplaintScreenState();
}

class _RaizzComplaintScreenState extends State<RaizzComplaintScreen> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.h,
          Row(
            children: [
              Container(
                height: 40,
                width: 10,
                color: primaryColor,
              ),
              10.w,
              SizedBox(
                width: size.width * 0.9,
                child: CustomText("Complaints", black, 32, FontWeight.w500,
                    TextOverflow.clip, TextAlign.left),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText("Sort by:  ", black, 12, FontWeight.w500,
                      TextOverflow.clip, TextAlign.left),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Date",
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
                ],
              ),
            ),
          ),
          10.h,
          complaintItems.isEmpty
              ? SizedBox()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: complaintItems.length,
                  padding: EdgeInsets.only(left: 14, right: 14),
                  itemBuilder: (context, index) {
                    var data = complaintItems[index];
                    return ComplaintWidget(data: data);
                  },
                ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: InkWell(
              onTap: () {},
              child: Text(
                "View Published queries",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
