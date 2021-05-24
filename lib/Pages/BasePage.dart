import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: titlemethod(),
        elevation: 0,
      ),
      body: buildMethod(),
    );
  }

  Text titlemethod() => Text("Medicine Management System");

  Widget buildMethod() => Text("BasePage");
}
