class Company {
  int? id;
  DateTime? addedOn;
  String? name;
  String? licenseNo;
  String? address;
  String? contactNo;
  String? email;
  String? description;

  Company(
      {this.id,
      this.addedOn,
      this.name,
      this.licenseNo,
      this.address,
      this.contactNo,
      this.email,
      this.description});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedOn = DateTime.parse(json['added_on']);
    name = json['name'];
    licenseNo = json['license_no'];
    address = json['address'];
    contactNo = json['contact_no'];
    email = json['email'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['license_no'] = this.licenseNo;
    data['address'] = this.address;
    data['contact_no'] = this.contactNo;
    data['email'] = this.email;
    data['description'] = this.description;
    return data;
  }

  @override
  String toString() {
    return this.name!;
  }
}
