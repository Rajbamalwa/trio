import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trio/trio/Views/CartScreen.dart';

import '../../Constants/colors.dart';
import '../Widgets/Button/CustomButton.dart';

class StepsScreeen extends StatefulWidget {
  const StepsScreeen({super.key});

  @override
  State<StepsScreeen> createState() => _StepsScreeenState();
}

class _StepsScreeenState extends State<StepsScreeen> {
  List steps = [
    {
      'step': 1,
      'detail':
          "Lorem ipsum dolor sit amet consectetur. Diam egestas vitae et ac.Lorem ipsum dolor sit amet consectetur. Diam egestas vitae et ac.",
      "length": 5
    },
    {
      'step': 2,
      'detail':
          "Lorem ipsum dolor sit amet consectetur. Diam egestas vitae et ac.Lorem ipsum dolor sit amet consectetur. Diam egestas vitae et ac.",
      "length": 4
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        // leading: Icon(Icons.arrow_back_rounded),
        title: Text(
          "Steps in services",
          style: GoogleFonts.urbanist(
            color: black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: stepsWidget(steps[index]));
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: "Next",
              onTap: () {
                Get.to(const CartScreen());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget stepsWidget(data) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
            child: Text(
              "Steps ${data['step']}",
              style: GoogleFonts.urbanist(
                color: black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(
              data['detail'],
              style: GoogleFonts.urbanist(
                color: grey,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: data['length'],
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/step.png",
                        scale: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 15),
                        child: Text(
                          "Cream",
                          style: GoogleFonts.urbanist(
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45, left: 15),
                        child: Text(
                          "Boroplus",
                          style: GoogleFonts.philosopher(
                            color: black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 85, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$40",
                              style: GoogleFonts.poppins(
                                color: black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.edit,
                              color: black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                child: Text(
                  "Replace product",
                  style: GoogleFonts.urbanist(
                    color: black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: grey,
                    radius: 10,
                    child: Center(
                      child: Icon(
                        Icons.clear,
                        color: white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 140,
            child: ListView.builder(
              itemCount: data['length'],
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/step2.png",
                            scale: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, left: 6),
                            child: Container(
                              decoration: BoxDecoration(
                                color: grey.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Cream",
                                  style: GoogleFonts.urbanist(
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6, left: 6),
                        child: Text(
                          "Pond’s Facecream",
                          style: GoogleFonts.urbanist(
                            color: black,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          "\$20",
                          style: GoogleFonts.philosopher(
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
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
    );
  }
}
