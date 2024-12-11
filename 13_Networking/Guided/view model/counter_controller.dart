import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getsnackbar() {
    Get.snackbar('GetX SnackBar', 'Ini Snackbar',
        colorText: Colors.white, backgroundColor: Colors.green);
  }

  void getdialog() {
    Get.defaultDialog(title: 'GetX Dialog', middleText: 'Ini dialog');
  }

  void getbottomSheet() {
    Get.bottomSheet(
      Container(
          height: 200,
          color: Colors.amber,
          child: Center(
              child: Center(child: Text("ini adalah dialog bottom sheet")))),
    );
  }
}
