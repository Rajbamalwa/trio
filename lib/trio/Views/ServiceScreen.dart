import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/trio/Widgets/TextField/TextFieldWidget.dart';

import '../../Constants/colors.dart';
import 'EditingScreen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  List serviceTypes = [
    {
      "type": "Gold Facial",
      "detail": "Lorem ipsum dolor sit amet consectetur."
    },
    {
      "type": "Silver Facial",
      "detail": "Lorem ipsum dolor sit amet consectetur."
    },
    {
      "type": "Platinum Facial",
      "detail": "Lorem ipsum dolor sit amet consectetur."
    },
    {
      "type": "Pearl Facial",
      "detail": "Lorem ipsum dolor sit amet consectetur."
    }
  ];
  List listColor = [
    Color.fromRGBO(227, 163, 2, 1),
    Color.fromRGBO(182, 192, 214, 1),
    Color.fromRGBO(135, 112, 79, 1),
    Color.fromRGBO(212, 247, 254, 1)
  ];
  List listBackgroundColor = [
    Color.fromRGBO(252, 243, 222, 1),
    Color.fromRGBO(239, 240, 243, 1),
    Color.fromRGBO(245, 241, 239, 1),
    Color.fromRGBO(232, 251, 255, 1)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        // backgroundColor: Colors.grey,
        automaticallyImplyLeading: true,
        leading: Icon(Icons.arrow_back_rounded),
        title: Text(
          "Services",
          style: GoogleFonts.urbanist(
            color: black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CustomTextField2(
            maxLines: 1,
            controller: controller,
            prefixIcon: Icon(
              Icons.search,
              color: grey,
            ),
            hintText: "Search",
            suffixIcon: Image.asset(
              "assets/images/filter.png",
              scale: 3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: serviceTypes.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return ServiceTypeWidget(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding ServiceTypeWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        splashColor: grey,
        onTap: () {
          Get.to(const EditingScreen());
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: listBackgroundColor[index],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: listColor[index].withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: listColor[index],
                  ),
                ),
              ),
              title: Text(
                serviceTypes[index]['type'],
                style: GoogleFonts.urbanist(
                  color: listColor[index].withOpacity(0.9),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                serviceTypes[index]['detail'],
                style: GoogleFonts.urbanist(
                  color: grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
