import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mms/Controller/CompanyController.dart';
import 'package:mms/Controller/MedicineController.dart';
import 'package:mms/Controller/ScreenController.dart';
import 'package:mms/Pages/AgeCalC/AgeCalc.dart';
import 'package:mms/Pages/Company/AddCompany.dart';
import 'package:mms/Pages/Medicine/AddMedicine.dart';
import 'package:mms/Pages/Medicine/MedicineList.dart';
import 'package:mms/Pages/Company/CompanyList.dart';

class CustomDrawer extends StatelessWidget {
  final companyController = Get.put(CompanyController());
  final medicineController = Get.put(MedicineController());
  final screeController = Get.put(ScreenController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Stack(
            children: [
              Transform.rotate(
                angle: pi / 3,
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 5,
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.cyan, Colors.cyanAccent],
                    ),
                  ),
                  height: 300,
                ),
              ),
              DrawerHeader(
                child: Text("data"),
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.business_center_rounded),
            title: Text("Company"),
            children: [
              ListTile(
                leading: Icon(Icons.add_circle),
                title: Text("Add Company"),
                onTap: () {
                  // Get.snackbar("Route Change", "Going to Add Company",
                  //     snackPosition: SnackPosition.BOTTOM);
                  //Get.back();
                  Get.to(() => AddCompany(),
                      transition: Transition.rightToLeftWithFade);
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text("View Companies"),
                onTap: () => {
                  Get.to(
                    () => CompanyList(),
                    transition: Transition.rightToLeftWithFade,
                  ),
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.local_hospital),
            title: Text("Medicine"),
            children: [
              ListTile(
                leading: Icon(Icons.add_circle),
                title: Text("Add Medicine"),
                onTap: () {
                  // Get.snackbar("Route Change", "Going to Add Company",
                  //     snackPosition: SnackPosition.BOTTOM);
                  //Get.back();
                  Get.to(
                    () => AddMedicine(),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text("View Medicine"),
                onTap: () => {
                  Get.to(
                    () => MedicineList(),
                    transition: Transition.rightToLeftWithFade,
                  ),
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Genarate Bill"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("View Companies"),
            onTap: () => {
              Get.to(
                () => AgeCalc(),
                transition: Transition.rightToLeftWithFade,
              ),
            },
          ),
        ],
      ),
    );
  }
}
