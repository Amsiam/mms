import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mms/Controller/CompanyController.dart';
import 'package:mms/Pages/BasePage.dart';
import 'package:mms/Pages/Company/EditCompany.dart';
import 'package:mms/Pages/Company/SingleCompany.dart';

class CompanyList extends BasePage {
  @override
  Text titlemethod() {
    return Text("Companies List");
  }

  final CompanyController companyController = Get.find();
  @override
  Widget buildMethod() {
    if (companyController.companylist.length <= 0) {
      companyController.getAllCompany();
    }
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          await companyController.getAllCompany();
        },
        child: GetX<CompanyController>(
          builder: (context) {
            // ignore: unrelated_type_equality_checks
            if (context.isloading == true)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: context.companylist.length,
              itemBuilder: (content, index) {
                return Slidable(
                  actionPane: SlidableScrollActionPane(),
                  actionExtentRatio: 0.1,
                  actions: [
                    IconSlideAction(
                      caption: 'View',
                      color: Colors.greenAccent,
                      icon: Icons.show_chart,
                      onTap: () => Get.to(
                        SingleCompany(
                          company: context.companylist[index],
                        ),
                        transition: Transition.fadeIn,
                      ),
                    ),
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.blue,
                      icon: Icons.edit,
                      onTap: () => Get.to(
                        EditCompany(
                          company: context.companylist[index],
                          index: index,
                        ),
                        transition: Transition.fadeIn,
                      ),
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.redAccent,
                      icon: Icons.delete_forever,
                      onTap: () => companyController.deletecompany(
                          context.companylist[index], index),
                    ),
                  ],
                  secondaryActions: [
                    IconSlideAction(
                      caption: 'View',
                      color: Colors.greenAccent,
                      icon: Icons.show_chart,
                      onTap: () => Get.to(
                        SingleCompany(
                          company: context.companylist[index],
                        ),
                        transition: Transition.fadeIn,
                      ),
                    ),
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.blue,
                      icon: Icons.edit,
                      onTap: () => Get.to(
                        EditCompany(
                          company: context.companylist[index],
                        ),
                        transition: Transition.fadeIn,
                      ),
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.redAccent,
                      icon: Icons.delete_forever,
                      onTap: () => companyController.deletecompany(
                          context.companylist[index], index),
                    ),
                  ],
                  child: ListTile(
                    onTap: () => Get.to(
                      SingleCompany(
                        company: context.companylist[index],
                      ),
                      transition: Transition.fadeIn,
                    ),
                    leading: Text("${index + 1}"),
                    title: Text("${context.companylist[index].name}"),
                    subtitle: Text("${context.companylist[index].licenseNo}"),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
