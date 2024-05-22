import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/utils/extension/sized_box_extension.dart';

import '../../../utils/raizz_constants/colors.dart';
import '../../../utils/raizz_global_widget/CustomText/CustomText.dart';
import '../../../utils/raizz_global_widget/TabBar/TabBarWidget.dart';
import '../../../utils/raizz_global_widget/TextField/TextFieldWidget.dart';
import '../widget/service_widget.dart';

List servicesItem = [
  {
    "service": "Haircut",
    "by": "Vikar",
    "category": "Hair",
    "date": "2 march, 2024",
    "mrp": 200,
  },
  {
    "service": "Haircut",
    "by": "Vikar",
    "category": "Hair",
    "date": "2 march, 2024",
    "mrp": 200,
  },
  {
    "service": "Haircut",
    "by": "Vikar",
    "category": "Hair",
    "date": "2 march, 2024",
    "mrp": 200,
  },
  {
    "service": "Haircut",
    "by": "Vikar",
    "category": "Hair",
    "date": "2 march, 2024",
    "mrp": 200,
  },
  {
    "service": "Haircut",
    "by": "Vikar",
    "category": "Hair",
    "date": "2 march, 2024",
    "mrp": 200,
  },
];

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  late TextEditingController nameController;
  late TextEditingController wtController;
  late TextEditingController phoneController;
  late TextEditingController dobController;
  late TextEditingController expController;
  late TextEditingController attendanceController;
  String _selectedSort = "Hair";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: "Jully Moris");
    wtController = TextEditingController(text: "+919999998884");
    phoneController = TextEditingController(text: "+919999998884");
    dobController = TextEditingController(text: "20 - 08 - 1995");
    expController = TextEditingController(text: "4 Years");
    attendanceController = TextEditingController(text: "24");
  }

  ScrollController scrollController = ScrollController();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.h,
            Center(
              child: SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.edit,
                            color: white,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: CustomText(
                'Jully Moris',
                black,
                20,
                FontWeight.w700,
                TextOverflow.clip,
                TextAlign.center,
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: secondaryTextColor.withOpacity(0.1),
                        ),
                        child: TabBarMenu(
                          tabTitle: const [
                            "Services details",
                            "Personal details",
                          ],
                          onTap: (int i) {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: ScrollPhysics(),
                        children: [
                          serviceDetails(size),
                          personalDetails(size),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget personalDetails(size) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          eventAddHeading("Name"),
          CustomField(
            maxLines: 1,
            controller: nameController,
          ),
          eventAddHeading("Phone number"),
          CustomField(
            maxLines: 1,
            controller: phoneController,
          ),
          eventAddHeading("Whatsapp number"),
          CustomField(
            maxLines: 1,
            controller: wtController,
            suffixIcon: Image.asset(
              "assets/images/whatsapp.png",
              scale: 20,
              height: 40,
              width: 40,
            ),
          ),
          eventAddHeading("Date of Birth"),
          CustomField(
            maxLines: 1,
            controller: dobController,
          ),
          30.h,
        ],
      ),
    );
  }

  Widget serviceDetails(size) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              children: [
                CustomText(
                  "Service Frequency: ",
                  black,
                  12,
                  FontWeight.w700,
                  TextOverflow.ellipsis,
                  TextAlign.left,
                ),
                CustomText(
                  "25 days",
                  primaryColor,
                  12,
                  FontWeight.w700,
                  TextOverflow.ellipsis,
                  TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  child: CustomText(
                    "Service History",
                    black,
                    12,
                    FontWeight.w600,
                    TextOverflow.ellipsis,
                    TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        "Date Range: ",
                        black,
                        12,
                        FontWeight.w600,
                        TextOverflow.ellipsis,
                        TextAlign.right,
                      ),
                      SizedBox(
                          width: size.width * 0.2,
                          child: Text(
                            " Last 3 Months",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            controller: scrollController,
            itemCount: servicesItem.length,
            padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
            itemBuilder: (context, index) {
              return ServiceWidget(
                data: servicesItem[index],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget eventAddHeading(text) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 6),
        child: CustomText(text, black, 14, FontWeight.w400, TextOverflow.clip,
            TextAlign.left));
  }
}
