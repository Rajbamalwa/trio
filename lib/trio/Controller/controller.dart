// Example of injecting a controller with GetX
import 'package:get/get.dart';

class UserController extends GetxController {
  var selectedLipstickValue =
      ''.obs; // Observable variable to store selected value

  void updateLipstickValue(value) {
    selectedLipstickValue.value = value;
  }

  var selectedGlowValue = ''.obs; // Observable variable to store selected value

  void updateGlowValue(value) {
    selectedGlowValue.value = value;
  }

  var selectedHairValue = ''.obs; // Observable variable to store selected value

  void updateHairValue(value) {
    selectedHairValue.value = value;
  }
}
