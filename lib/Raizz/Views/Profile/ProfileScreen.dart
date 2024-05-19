import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Constants/colors.dart';
import '../../Widgets/CustomText/CustomText.dart';
import '../../Widgets/DropDownButton/DropDownButtonWidget.dart';
import '../../Widgets/TabBar/TabBarWidget.dart';
import '../../Widgets/TextField/TextFieldWidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController dobController;
  late TextEditingController expController;
  late TextEditingController attendanceController;
  String _selectedSort = "Hair";

  final List<String> _sortItems = [
    'Hair',
    'Face',
    'Body',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: "Jully Moris");
    emailController = TextEditingController(text: "jully@gmail.com");
    phoneController = TextEditingController(text: "+919999998884");
    dobController = TextEditingController(text: "20 - 08 - 1995");
    expController = TextEditingController(text: "4 Years");
    attendanceController = TextEditingController(text: "24");
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
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
                            "Personal details",
                            "Employment details"
                          ],
                          onTap: (int i) {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: ScrollPhysics(),
                        children: [
                          personalDataWidget(),
                          employmentDataWidget(),
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

  Widget personalDataWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        eventAddHeading("Name"),
        CustomField(
          maxLines: 1,
          controller: nameController,
        ),
        eventAddHeading("Email"),
        CustomField(
          maxLines: 1,
          controller: emailController,
        ),
        eventAddHeading("Phone number"),
        CustomField(
          maxLines: 1,
          controller: phoneController,
        ),
        eventAddHeading("Date of Birth"),
        CustomField(
          maxLines: 1,
          controller: dobController,
        ),
      ],
    );
  }

  Widget employmentDataWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        eventAddHeading("Experience"),
        CustomField(
          maxLines: 1,
          controller: expController,
        ),
        eventAddHeading("Services Provided"),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor.withOpacity(0.05),
            ),
            // width: width * 0.4,
            child: CustomDropdownField(
              labelText: "Category",
              items: _sortItems,
              value: _selectedSort,
              Hint: "Category",
              onChanged: (value) {
                setState(() {
                  _selectedSort = value;
                });
              },
            ),
          ),
        ),
        eventAddHeading("Attendance"),
        CustomField(
          maxLines: 1,
          controller: attendanceController,
          suffixIcon: Icon(
            Icons.add,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eventAddHeading("Rating"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 6),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      size: 10,
                      color: Colors.amber,
                    ),
                    itemSize: 20,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eventAddHeading("Last Month Rating"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 6),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      size: 10,
                      color: Colors.amber,
                    ),
                    itemSize: 20,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        eventAddHeading("Certificates"),
        SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),

            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget eventAddHeading(text) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 6),
        child: CustomText(text, black, 14, FontWeight.w400, TextOverflow.clip,
            TextAlign.left));
  }
}
