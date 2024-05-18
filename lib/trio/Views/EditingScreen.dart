import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/Constants/colors.dart';

import '../Controller/controller.dart';
import '../Widgets/Button/CustomButton.dart';
import 'StepsScreen.dart';

class EditingScreen extends StatefulWidget {
  const EditingScreen({super.key});

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  List lipstickColors = [pink, red, purple, maroon, grey];
  List lipstickColorsName = ["Pink", "Red", "Purple", "Maroon", "None"];
  List glowColors = [maroon, yellow, silver, platinum, grey];
  List glowColorsName = ["blown", "Gold", "Silver", "Platinum", "None"];
  List hairColors = [maroon, yellow, silver, platinum, grey];
  List hairColorsName = ["Pink", "Gold", "Silver", "Platinum", "None"];
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: transparent,
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.6,
                        // height: 400,
                        width: width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/user.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 10,
                        left: 10,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: primaryColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Show Transaction",
                                      style: GoogleFonts.urbanist(
                                        color: white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 20,
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 0, child: EditingColorWidgets(width, height)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: "Apply",
              onTap: () {
                Get.to(const StepsScreeen());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget EditingColorWidgets(double width, height) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(14),
            topLeft: Radius.circular(14),
          ),
          color: white,
          border: Border.all(color: white)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EditingTypeWidget("assets/images/lipstick.png", "Lipstick"),
                  SizedBox(
                    height: 50,
                    // width: width* 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: lipstickColors.length,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    userController.updateLipstickValue(
                                        lipstickColorsName[index].toString());
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: lipstickColors[index],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: userController
                                                      .selectedLipstickValue
                                                      .value ==
                                                  lipstickColorsName[index]
                                                      .toString()
                                              ? primaryColor
                                              : white,
                                          width: 2),
                                    ),
                                  ),
                                ),
                                Text(
                                  lipstickColorsName[index].toString(),
                                  style: GoogleFonts.urbanist(
                                    color: grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EditingTypeWidget("assets/images/glow.png", "Glow"),
                  SizedBox(
                    height: 50,
                    // width: width* 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: lipstickColors.length,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (constext, index) {
                        return Obx(() {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    userController.updateGlowValue(
                                        glowColorsName[index].toString());
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: glowColors[index],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: userController
                                                      .selectedGlowValue
                                                      .value ==
                                                  glowColorsName[index]
                                                      .toString()
                                              ? primaryColor
                                              : white,
                                          width: 2),
                                    ),
                                  ),
                                ),
                                Text(
                                  glowColorsName[index].toString(),
                                  style: GoogleFonts.urbanist(
                                    color: grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EditingTypeWidget("assets/images/hair.png", "Hair"),
                  SizedBox(
                    height: 50,
                    // width: width* 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: hairColors.length,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (constext, index) {
                        return Obx(() {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    userController.updateHairValue(
                                        hairColorsName[index].toString());
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: hairColors[index],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: userController
                                                      .selectedHairValue
                                                      .value ==
                                                  hairColorsName[index]
                                                      .toString()
                                              ? primaryColor
                                              : white,
                                          width: 2),
                                    ),
                                  ),
                                ),
                                Text(
                                  hairColorsName[index].toString(),
                                  style: GoogleFonts.urbanist(
                                    color: grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget EditingTypeWidget(image, name) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Image.asset(
                  image,
                  scale: 6,
                ),
              ),
            ),
          ),
          Text(
            name,
            style: GoogleFonts.urbanist(
              color: black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
