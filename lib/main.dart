import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/date.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDUSRvi4OBiAoCLG0cv1nwniXeyoj0gu8A",
          appId: "1:48862076737:android:6b89377c8d773f955e0bc0",
          messagingSenderId: "48862076737",
          projectId: "project-2-c1c00"));

  runApp(DatePickerScreen());
}

// ignore: camel_case_types, must_be_immutable
class Home_Page extends StatefulWidget {
  Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

// ignore: camel_case_types
class _Home_PageState extends State<Home_Page> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  addData(String name, String email, String pwd) async {
    if (name == "" && email == "" && pwd == "") {
      print("Enter Data");
    } else {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(email)
          .set({"Name": name, "Email": email, "Pwd": pwd}).then((value) {
        print("data inserted");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Insert Record"),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Full Name")),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Email Address")),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: TextFormField(
                controller: pwdController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Password")),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  addData(
                      nameController.text.toString(),
                      emailController.text.toString(),
                      pwdController.text.toString());
                  print("result");
                },
                child: const Text("Insert"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
