import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trio/pages/home/view/raizz_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: RaizHomeScreen(),
    );
  }
}
