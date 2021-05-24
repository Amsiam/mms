import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mms/models/Company.dart';
import 'package:dio/dio.dart';

class CompanyController extends GetxController {
  var companylist = <Company>[].obs;
  var isloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    //getAllCompany();
  }

  getAllCompany() async {
    isloading.value = true;
    List<Company> letestlist = [];
    var dio = Dio();
    try {
      var response = await dio.get("http://127.0.0.1:8000/api/company/");
      var datas = response.data['data'];
      for (var data in datas) {
        Company company = Company.fromJson(data);
        letestlist.add(company);
      }
      companylist.value = letestlist;
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
    //companylist.add(companies);
  }

  addcompany(Company company) async {
    isloading.value = true;
    try {
      var response = await Dio().post(
        "http://127.0.0.1:8000/api/company/",
        data: company.toJson(),
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
        Company company = Company.fromJson(response.data['data']);
        companylist.add(company);
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

  //Delete
  deletecompany(Company company, int index) async {
    try {
      var response = await Dio()
          .delete("http://127.0.0.1:8000/api/company/${company.id}/");
      if (response.data['error'] == false) {
        companylist.removeAt(index);
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

  //Edit
  editcompany(Company company, int? index) async {
    isloading.value = true;
    try {
      var response = await Dio().put(
        "http://127.0.0.1:8000/api/company/${company.id}/",
        data: company.toJson(),
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
          "Edit successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
        );

        companylist[index!] = company;
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
}
