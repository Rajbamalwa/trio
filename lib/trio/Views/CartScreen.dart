import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/colors.dart';
import '../Widgets/Button/CustomButton.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List items = [
    {
      "name": "Boroplus Cream",
      "image": "assets/images/step2.png",
      "detail": "description description description description description",
      "quantity": 2,
      "price": 25,
    },
    {
      "name": "Boroplus Cream",
      "image": "assets/images/step2.png",
      "detail": "description description description description description",
      "quantity": 2,
      "price": 25,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Place Order for products",
          style: GoogleFonts.urbanist(
            color: black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CartWidget(items[index]));
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 10, right: 20, bottom: 10),
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
                      padding: EdgeInsets.only(
                          left: 20, top: 10, right: 20, bottom: 10),
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
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20),
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
                                  padding:
                                      const EdgeInsets.only(top: 6, left: 6),
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
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.location_on,
                color: primaryColor,
              ),
              title: Row(
                children: [
                  Text(
                    "Delivering to ",
                    style: GoogleFonts.urbanist(
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Saloon",
                    style: GoogleFonts.urbanist(
                      color: black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                "4-A, Kalaji goraji udaipur rajasthan",
                style: GoogleFonts.urbanist(
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.access_time_filled_outlined,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        "Enter preferred time",
                        style: GoogleFonts.urbanist(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: "Pay & Place Order",
                onTap: () {
                  Get.to(const CartScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CartWidget(data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
      ),
      child: ListTile(
        leading: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                data['image'].toString(),
              ),
            ),
          ),
        ),
        title: Text(
          data['name'].toString(),
          style: GoogleFonts.urbanist(
            color: black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          data['detail'].toString(),
          style: GoogleFonts.urbanist(
            color: secondaryTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "- ",
                      style: GoogleFonts.urbanist(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    data['quantity'].toString(),
                    style: GoogleFonts.urbanist(
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "\$${data['price']}",
              style: GoogleFonts.urbanist(
                color: grey,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
