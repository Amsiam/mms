import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mms/Controller/CompanyController.dart';
import 'package:mms/Pages/BasePage.dart';
import 'package:mms/Widget/CompanyForm.dart';
import 'package:mms/models/Company.dart';
import 'package:get/get.dart';

class EditCompany extends BasePage {
  final Company? company;
  final int? index;

  EditCompany({this.company, this.index});
  @override
  Text titlemethod() {
    return Text("Edit Company");
  }

  final CompanyController companyController = CompanyController();
  @override
  Widget buildMethod() {
    TextEditingController name = TextEditingController();
    TextEditingController licenseNo = TextEditingController();
    TextEditingController contactNo = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController address = TextEditingController();
    name.text = "${company?.name}";
    licenseNo.text = "${company?.licenseNo}";
    contactNo.text = "${company?.contactNo}";
    email.text = "${company?.email}";
    description.text = "${company?.description}";
    address.text = "${company?.address}";
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            Get.width * 0.1, Get.width * 0.05, Get.width * 0.1, 2),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CompanyForm(
                controller: name,
                labelText: "Company name",
              ),
              SizedBox(
                height: 5,
              ),
              CompanyForm(
                controller: licenseNo,
                labelText: "Company licenseNo",
              ),
              SizedBox(
                height: 5,
              ),
              CompanyForm(
                controller: address,
                labelText: "Company address",
              ),
              SizedBox(
                height: 5,
              ),
              CompanyForm(
                controller: contactNo,
                labelText: "Company contactNo",
              ),
              SizedBox(
                height: 5,
              ),
              CompanyForm(
                controller: email,
                labelText: "Company email",
              ),
              SizedBox(
                height: 5,
              ),
              CompanyForm(
                controller: description,
                labelText: "Company description",
              ),
              SizedBox(
                height: 5,
              ),
              GetX<CompanyController>(
                builder: (context) {
                  return context.isloading.value == true
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                          clipBehavior: Clip.antiAlias,
                          onPressed: () async {
                            if (GetUtils.isEmail(email.text) == false) {
                              Get.snackbar(
                                "Error",
                                "Email is not valid.",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackStyle: SnackStyle.FLOATING,
                              );
                            } else {
                              Company c = Company(
                                id: company?.id,
                                name: name.text,
                                licenseNo: licenseNo.text,
                                address: address.text,
                                contactNo: contactNo.text,
                                email: email.text,
                                description: description.text,
                                addedOn: company?.addedOn,
                              );
                              await context.editcompany(c, index);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Edit'),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
