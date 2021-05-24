import 'package:flutter/material.dart';

class MainPageCard extends StatelessWidget {
  final String? title;
  final Text? total;
  final Color? cardcolor;
  MainPageCard({this.title, this.total, this.cardcolor});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text((title != null ? title : "Unknown")!)),
          SizedBox(
            height: 10,
          ),
          Center(
            child: total,
          ),
        ],
      ),
    );
  }
}
