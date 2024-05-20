import 'package:flutter/material.dart';
import 'package:trio/utils/extension/sized_box_extension.dart';

import '../../../Constants/colors.dart';
import '../../../trio/Widgets/Button/CustomButton.dart';
import '../../../utils/raizz_global_widget/CustomText/CustomText.dart';
import '../../../utils/raizz_global_widget/DropDownButton/DropDownButtonWidget.dart';
import '../../../utils/raizz_global_widget/TextField/TextFieldWidget.dart';

class InventoryUpdateScreen extends StatefulWidget {
  final data;
  const InventoryUpdateScreen({super.key, this.data});

  @override
  State<InventoryUpdateScreen> createState() => _InventoryUpdateScreenState();
}

class _InventoryUpdateScreenState extends State<InventoryUpdateScreen> {
  DateTime selectedDate = DateTime.now();

  late TextEditingController itemController;
  late TextEditingController dateController;
  late TextEditingController unitsController;
  late TextEditingController costsController;
  late TextEditingController mrpController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemController =
        TextEditingController(text: widget.data['title'].toString());
    dateController =
        TextEditingController(text: widget.data['date'].toString());
    unitsController =
        TextEditingController(text: widget.data['unit'].toString());
    costsController =
        TextEditingController(text: widget.data['cost_price'].toString());
    mrpController =
        TextEditingController(text: widget.data['price'].toString());
    _selectedSort = widget.data['category'].toString();
  }

  String _selectedSort = "Hair";

  final List<String> _sortItems = [
    'Hair',
    'Face',
    'Body',
  ];
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h,
          Row(
            children: [
              Container(
                height: 40,
                width: 10,
                color: primaryColor,
              ),
              10.w,
              SizedBox(
                  width: width * 0.8,
                  child: CustomText("Edit Inventory", black, 32,
                      FontWeight.w500, TextOverflow.clip, TextAlign.left)),
            ],
          ),
          eventAddHeading("Item Name"),
          CustomField(
            maxLines: 1,
            controller: itemController,
          ),
          eventAddHeading("Date"),
          CustomField(
            onTap: () {
              _selectDate(context);
            },
            maxLines: 1,
            controller: dateController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eventAddHeading("Units added "),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor.withOpacity(0.05),
                      ),
                      child: CustomField(
                        maxLines: 1,
                        controller: unitsController,
                        from: "update_inventory",
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eventAddHeading("Category"),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor.withOpacity(0.05),
                      ),
                      width: width * 0.4,
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
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eventAddHeading("Cost Price"),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor.withOpacity(0.05),
                      ),
                      child: CustomField(
                        maxLines: 1,
                        controller: costsController,
                        from: "update_inventory",
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eventAddHeading("Selling Price/ MRP"),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor.withOpacity(0.05),
                      ),
                      child: CustomField(
                        maxLines: 1,
                        controller: mrpController,
                        from: "update_inventory",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Center(
              child: CustomButton(
                text: "Save",
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      locale: const Locale('en', 'US'),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text =
            "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}";
      });
    }
  }

  Widget eventAddHeading(text) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 6),
        child: CustomText(text, black, 14, FontWeight.w400, TextOverflow.clip,
            TextAlign.left));
  }
}
