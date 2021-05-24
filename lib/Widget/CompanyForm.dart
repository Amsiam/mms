import 'package:flutter/material.dart';

class CompanyForm extends StatelessWidget {
  //final Function(String)? value;
  final String? labelText;
  final bool expended;
  final TextEditingController? controller;
  CompanyForm({this.labelText, this.controller, this.expended = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      expands: expended,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
