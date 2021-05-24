import 'package:flutter/material.dart';

class AgeCalc extends StatefulWidget {
  @override
  _AgeCalcState createState() => _AgeCalcState();
}

class _AgeCalcState extends State<AgeCalc> {
  int? age, month, day;
  DateTime? dob, fromdate;
  @override
  void initState() {
    super.initState();
  }

  void _showBirthday() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        dob = value;
      });
    });
  }

  void _showFromdate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        fromdate = value;
      });
    });
  }

  calculateage() {
    if (fromdate == null) {
      fromdate = DateTime.now();
    }
    if (dob == null) {
      dob = DateTime.now();
    }
    setState(() {
      var date = fromdate!.difference(dob!);
      int days = date.inDays;
      age = (days ~/ 365);
      days %= 365;
      month = days ~/ 30;
      days %= 30;
      day = days;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calc"),
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: _showBirthday,
                child: Text(
                    dob == null ? "Tap to select Birth date" : dob.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: _showFromdate,
                child: Text(fromdate == null
                    ? "Tap to select from date"
                    : fromdate.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: calculateage,
                child: Text("Tap to calculate"),
              ),
              SizedBox(
                height: 10,
              ),
              age == null
                  ? Container()
                  : Text("$age year, $month month $day days")
            ],
          ),
        ),
      ),
    );
  }
}
