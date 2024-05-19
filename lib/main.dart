import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Raizz/Views/Inventory/InventoryScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: InventoryScreen(),
    );
  }
}
