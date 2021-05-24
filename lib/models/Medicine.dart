import 'package:mms/models/Company.dart';

class Medicine {
  int? id;
  String? addedOn;
  String? name;
  String? medicineType;
  String? buyPrice;
  String? sellPrice;
  String? batchNo;
  String? selfNo;
  int? inStockTotal;
  int? qtyInStrip;
  int? companyId;
  Company? company;

  Medicine(
      {this.id,
      this.addedOn,
      this.name,
      this.medicineType,
      this.buyPrice,
      this.sellPrice,
      this.batchNo,
      this.selfNo,
      this.inStockTotal,
      this.qtyInStrip,
      this.companyId,
      this.company});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedOn = json['added_on'];
    name = json['name'];
    medicineType = json['medicine_type'];
    buyPrice = json['buy_price'];
    sellPrice = json['sell_price'];
    batchNo = json['batch_no'];
    selfNo = json['self_no'];
    inStockTotal = json['in_stock_total'];
    qtyInStrip = json['qty_in_strip'];
    companyId = json['company_id'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['medicine_type'] = this.medicineType;
    data['buy_price'] = this.buyPrice;
    data['sell_price'] = this.sellPrice;
    data['batch_no'] = this.batchNo;
    data['self_no'] = this.selfNo;
    data['in_stock_total'] = this.inStockTotal;
    data['qty_in_strip'] = this.qtyInStrip;
    data['company_id'] = this.companyId;
    return data;
  }
}
