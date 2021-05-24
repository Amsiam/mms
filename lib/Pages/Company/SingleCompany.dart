import 'package:flutter/material.dart';
import 'package:mms/Pages/BasePage.dart';
import 'package:mms/models/Company.dart';

class SingleCompany extends BasePage {
  final Company? company;

  SingleCompany({this.company});
  @override
  Text titlemethod() {
    return Text("${company?.name}");
  }

  @override
  Widget buildMethod() {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: Text("Name: "),
            title: Text("${company?.name}"),
          ),
          ListTile(
            leading: Text("License No: "),
            title: Text("${company?.licenseNo}"),
          ),
          ListTile(
            leading: Text("Contact No: "),
            title: Text("${company?.contactNo}"),
          ),
          ListTile(
            leading: Text("Address: "),
            title: Text("${company?.address}"),
          ),
          ListTile(
            leading: Text("Email: "),
            title: Text("${company?.email}"),
          ),
          ListTile(
            leading: Text("Added on: "),
            title: Text("${company?.addedOn}"),
          ),
          ListTile(
            leading: Text("Description: "),
            title: Text(
              "${company?.description}",
            ),
          ),
        ],
      ),
    );
  }
}
