import 'package:flutter/material.dart';
import 'dart:async';

class datepic extends StatefulWidget {
  const datepic({super.key});

  @override
  State<datepic> createState() => _datepicState();
}

class _datepicState extends State<datepic> {
  _datepicState() {
    selectedbank = banknameList[0];
    selectedoccupation = occupationList[0];
  }

  final banknameList = [
    "State Bank of India",
    "HDFC Bank",
    "ICICI Bank",
    "Axis Bank",
    "Punjab National Bank",
    "Bank of Baroda",
    "Kotak Mahindra Bank",
    "Canara Bank",
    "Union Bank of India",
    "IndusInd Bank",
    "IDFC FIRST Bank",
    "Yes Bank",
    "Bank of India",
    "Central Bank of India",
    "Indian Bank",
    "UCO Bank",
    "Punjab & Sind Bank",
    "RBL Bank",
    "Federal Bank",
    "South Indian Bank",
    "IDBI Bank",
    "Karur Vysya Bank",
    "City Union Bank",
    "Bandhan Bank",
    "Jammu & Kashmir Bank",
    "Dhanlaxmi Bank"
  ];
  String? selectedbank = "";

  final occupationList = ["Private Sector", "Government Employee", "Business"];
  String? selectedoccupation = "";

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("datepicker"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("${selectedDate.toLocal()}".split(' ')[0]),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select date'),
              ),
              DropdownButtonFormField(
                value: selectedoccupation,
                items: occupationList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedoccupation = val as String;
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
            ],
          ),
        ),
      ),
    );
  }
}
