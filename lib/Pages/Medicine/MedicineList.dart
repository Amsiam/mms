import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mms/Controller/MedicineController.dart';
import 'package:mms/Pages/BasePage.dart';

class MedicineList extends BasePage {
  @override
  Text titlemethod() {
    return Text("Medicine List");
  }

  final MedicineController medicinecontroller = Get.find();
  @override
  Widget buildMethod() {
    if (medicinecontroller.medicinelist.length <= 0) {
      medicinecontroller.getAllMedicine();
    }
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          await medicinecontroller.getAllMedicine();
        },
        child: GetX<MedicineController>(
          builder: (context) {
            if (context.isloading.value == true)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: context.medicinelist.length,
              itemBuilder: (content, index) {
                return Slidable(
                  actionPane: SlidableScrollActionPane(),
                  actionExtentRatio: 0.1,
                  actions: [
                    IconSlideAction(
                      caption: 'View',
                      color: Colors.greenAccent,
                      icon: Icons.show_chart,
                      onTap: () => {},
                    ),
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.blue,
                      icon: Icons.edit,
                      onTap: () => print("object"),
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.redAccent,
                      icon: Icons.delete_forever,
                      onTap: () => context.deletemedicine(
                          context.medicinelist[index], index),
                    ),
                  ],
                  secondaryActions: [],
                  child: ListTile(
                    onTap: () => print("view"),
                    leading: Text("${index + 1}"),
                    title: Text("${context.medicinelist[index].name}"),
                    subtitle: Text("${context.medicinelist[index].selfNo}"),
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
