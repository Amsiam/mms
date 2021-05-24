import 'package:get/get.dart';

class ScreenController extends GetxController {
  var gridsize = 4.obs;
  var ispassword = false.obs;

  swappassword() {
    ispassword.value = !ispassword.value!;
  }
}
