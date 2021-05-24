import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mms/models/Medicine.dart';

class MedicineController extends GetxController {
  var medicinelist = <Medicine>[].obs;
  var isloading = false.obs;

  getAllMedicine() async {
    isloading.value = true;
    List<Medicine> letestlist = [];
    try {
      var response = await Dio().get("http://127.0.0.1:8000/api/medicine/");
      var datas = response.data['data'];
      for (var data in datas) {
        Medicine medicine = Medicine.fromJson(data);
        letestlist.add(medicine);
      }
      medicinelist.value = letestlist;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
      );
    } finally {
      isloading.value = false;
    }
  }

  addmedicine(Medicine medicine) async {
    isloading.value = true;
    try {
      var response = await Dio().post(
        "http://127.0.0.1:8000/api/medicine/",
        data: medicine.toJson(),
        options: Options(
          headers: {
            Headers.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.data['error'] == true) {
        Get.snackbar(
          "Error",
          response.data['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Success",
          "Added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
        );
        Medicine medicine = Medicine.fromJson(response.data['data']);
        medicinelist.add(medicine);
      }
    } on DioError catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isloading.value = false;
    }
  }

  deletemedicine(Medicine medicine, int index) async {
    try {
      var response = await Dio()
          .delete("http://127.0.0.1:8000/api/medicine/${medicine.id}/");
      if (response.data['error'] == false) {
        medicinelist.removeAt(index);
        Get.snackbar(
          "Success",
          "Deleted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
        );
      }
    } catch (e) {
      isloading.value = true;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isloading.value = false;
    }
  }
}
