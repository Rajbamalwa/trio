// Example of injecting a controller with GetX
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxDouble sliderValue = 1.0.obs; // Observable variable to store slider value

  void updateSlider(value) {
    sliderValue.value = value;
  }
}
