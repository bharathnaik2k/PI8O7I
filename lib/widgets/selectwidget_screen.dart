import 'package:flutter/material.dart';

class SelectWidgetScreen extends StatefulWidget {
  final List<bool> value;
  const SelectWidgetScreen({super.key, required this.value});

  @override
  State<SelectWidgetScreen> createState() => _SelectWidgetScreenState();
}

class _SelectWidgetScreenState extends State<SelectWidgetScreen> {
  List<bool> seletedWidgets = [
    false,
    false,
    false,
  ];
  @override
  void initState() {
    seletedWidgets = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 230, 204),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widgetType(
              "Text Widget",
              seletedWidgets[0],
              () {
                setState(() {
                  seletedWidgets[0] = !seletedWidgets[0];
                });
              },
            ),
            widgetType(
              "Image Widget",
              seletedWidgets[1],
              () {
                setState(() {
                  seletedWidgets[1] = !seletedWidgets[1];
                });
              },
            ),
            widgetType(
              "Button Widget",
              seletedWidgets[2],
              () {
                setState(() {
                  seletedWidgets[2] = !seletedWidgets[2];
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: importWidget(),
    );
  }

  //
  Padding importWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 12, 100, 12),
      child: TextButton(
        style: const ButtonStyle(
          side: MaterialStatePropertyAll(
            BorderSide(width: 1),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
        ),
        onPressed: () {
          Navigator.of(context).pop(seletedWidgets);
        },
        child: const Text(
          "Import Widgets",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget widgetType(String name, bool isSelected, VoidCallback onPressed) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey,
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isSelected == true ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
