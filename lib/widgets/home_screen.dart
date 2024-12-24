import 'dart:io';

import 'package:assignment_prototype_pi8o7i/widgets/selectwidget_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  List<bool> selectedWidget = [
    false,
    false,
    false,
  ];
  bool atListOneMessage = false;
  File? image;

  //Image Picker Fun.
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            right: 12,
            left: 12,
          ),
          height: MediaQuery.sizeOf(context).height * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 204, 230, 204),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selectedWidget[0] == false &&
                    selectedWidget[1] == false &&
                    selectedWidget[2] == false)
                  const Text(
                    "No Widget is added",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                if (atListOneMessage == true)
                  const Text(
                    "Add At-Least a\nWidget To Save",
                    style: TextStyle(fontSize: 24),
                  ),
                if (selectedWidget[0] == true)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(12.0),
                    child: const TextField(
                      // controller: //,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 12, left: 12),
                        border: InputBorder.none,
                        hintText: "Enter Text",
                      ),
                    ),
                  ),
                if (selectedWidget[1] == true)
                  InkWell(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: image == null
                            ? const Text(
                                "Upload Image",
                                style: TextStyle(fontSize: 20),
                              )
                            : Image.file(image!),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                if (selectedWidget[2] == true)
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      side: const MaterialStatePropertyAll(
                        BorderSide(width: 1),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (selectedWidget[0] == true ||
                          selectedWidget[1] == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Successfully Saved",
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Color.fromARGB(255, 204, 230, 204),
                          ),
                        );
                      } else {
                        setState(() {
                          atListOneMessage = true;
                        });
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: addWidget(context)),
    );
  }

  //
  AppBar appBarWidget() {
    return AppBar(
      title: const Text("Assignment App"),
      centerTitle: true,
    );
  }

  //
  Padding addWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 5, 100, 10),
      child: TextButton(
        style: const ButtonStyle(
          side: MaterialStatePropertyAll(
            BorderSide(width: 1),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
        ),
        onPressed: () async {
          final selected =
              await Navigator.of(context).push<List<bool>?>(MaterialPageRoute(
            builder: (context) {
              return SelectWidgetScreen(value: selectedWidget);
            },
          ));
          setState(() {
            selectedWidget = selected ?? selectedWidget;
            atListOneMessage = false;
          });
        },
        child: const Text(
          "Add Widgets",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
