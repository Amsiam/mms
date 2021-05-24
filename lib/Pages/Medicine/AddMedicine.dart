import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mms/Controller/CompanyController.dart';
import 'package:mms/Controller/MedicineController.dart';
import 'package:mms/Pages/BasePage.dart';
import 'package:get/get.dart';
import 'package:mms/Pages/Medicine/MedicineList.dart';
import 'package:mms/models/Company.dart';
import 'package:mms/models/Medicine.dart';

class AddMedicine extends BasePage {
  @override
  Text titlemethod() {
    return Text("Add Medicine");
  }

  final CompanyController companyController = CompanyController();
  final _company = TextEditingController();
  final _name = TextEditingController();
  final _medicine_type = TextEditingController();
  final _buy_price = TextEditingController();
  final _sell_price = TextEditingController();
  final _batch_no = TextEditingController();
  final _self_no = TextEditingController();
  final _in_stock_total = TextEditingController();
  final _qty_in_strip = TextEditingController();

  // name = models.CharField(max_length=255)
  //   medicine_type = models.CharField(max_length=255)
  //   buy_price = models.CharField(max_length=255)
  //   sell_price = models.CharField(max_length=255)
  //   batch_no = models.CharField(max_length=255)
  //   self_no = models.CharField(max_length=255)
  //   company_id = models.ForeignKey(Company, on_delete=models.CASCADE)
  //   in_stock_total = models.IntegerField()
  //   qty_in_strip = models.IntegerField()
  @override
  Widget buildMethod() {
    if (companyController.companylist.length <= 0) {
      companyController.getAllCompany();
    }
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Medicine Name",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: RawAutocomplete<Company>(
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<Company> onSelected,
                      Iterable<Company> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: ListView(
                          children: options
                              .map(
                                (Company c) => ListTile(
                                  onTap: () => onSelected(c),
                                  title: Text("${c.name}"),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textediting) {
                    return companyController.companylist.where((Company c) => c
                        .name!
                        .toLowerCase()
                        .contains(textediting.text.toLowerCase()));
                  },
                  onSelected: (c) {
                    _company.text = "${c.id}";
                  },
                  fieldViewBuilder: (_, TextEditingController value, focusnode,
                      onfieldSubmitted) {
                    return TextFormField(
                      controller: value,
                      focusNode: focusnode,
                      decoration: InputDecoration(
                        labelText: "Company Name",
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            ),
                      ),
                      onFieldSubmitted: (String s) => onfieldSubmitted,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _medicine_type,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Medicine Type",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _buy_price,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Buy Price",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _sell_price,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Sell Price",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _batch_no,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Batch no",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _self_no,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Self no",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _in_stock_total,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "In Stock",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: TextFormField(
                  controller: _qty_in_strip,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Quantity in strip",
                  ),
                ),
              ),
              GetX<MedicineController>(
                builder: (controller) {
                  return controller.isloading.value == true
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          clipBehavior: Clip.antiAlias,
                          onPressed: () async {
                            var medicine = Medicine(
                              name: _name.text,
                              medicineType: _medicine_type.text,
                              buyPrice: _buy_price.text,
                              sellPrice: _sell_price.text,
                              batchNo: _batch_no.text,
                              selfNo: _self_no.text,
                              inStockTotal: int.parse(_in_stock_total.text),
                              qtyInStrip: int.parse(_qty_in_strip.text),
                              companyId: int.parse(_company.text),
                            );
                            try {
                              await controller.addmedicine(medicine);
                            } catch (e) {
                              Get.snackbar("Error", "Something is wrong!");
                            }
                            _name.text = "";
                            _medicine_type.text = "";
                            _buy_price.text = "";
                            _sell_price.text = "";
                            _batch_no.text = "";
                            _self_no.text = "";
                            _in_stock_total.text = "";
                            _qty_in_strip.text = "";
                            _company.text = "";
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Add'),
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
