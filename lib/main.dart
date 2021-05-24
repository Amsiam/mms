import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mms/Art/Art.dart';
import 'package:mms/Widget/MainPageCard.dart';
import 'package:mms/Widget/Responsive.dart';
import 'Drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<MainPageCard> getitems() {
    return [
      MainPageCard(
        title: "Total Companies",
        cardcolor: Colors.red,
        total: Text(
          "101",
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      MainPageCard(
        title: "Total Medicine",
        cardcolor: Colors.blue,
        total: Text(
          "101",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      MainPageCard(
        title: "Total Payments",
        cardcolor: Colors.orange,
        total: Text(
          "1001",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      MainPageCard(
        title: "Due Payments",
        cardcolor: Colors.amber,
        total: Text(
          "101",
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final WIDTH = Get.width;

    return GetMaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Medicine Management System"),
          elevation: 0,
        ),
        body: CustomPaint(
          size: Size(WIDTH, (WIDTH * 0.5128410914927769).toDouble()),
          painter: RPSCustomPainter(),
          child: Responsive(
            desktop: Container(
              child: GridView.count(
                crossAxisCount: 4,
                children: getitems(),
              ),
            ),
            mobile: Container(
              child: GridView.count(
                crossAxisCount: 2,
                children: getitems(),
              ),
            ),
            tablet: Container(
              child: GridView.count(
                crossAxisCount: 3,
                children: getitems(),
              ),
            ),
          ),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
