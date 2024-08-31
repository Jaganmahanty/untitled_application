import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  List<String> bloodGroupsList = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  String? selectedbBloodGroup = "A+";

  final banknameList = ["1", "2", "3"];
  String? selectedbank = "1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("DatePicker with TextFormField"),
          ),
          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              DropdownButtonFormField(
                value: selectedbBloodGroup,
                items: bloodGroupsList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedbBloodGroup = val as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: Colors.deepPurpleAccent,
                ),
                decoration: const InputDecoration(
                    labelText: "Name of Bank",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
              ),
            ]),
          ))),
    );
  }
}
