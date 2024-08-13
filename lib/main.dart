// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var WtController = TextEditingController();

  var FeetController = TextEditingController();

  var InchController = TextEditingController();

  var result = "";

  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 120, 134, 230),
          title: const Text("BMI Calculator"),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  colors: [Color(0xff30cfd0), Color(0xff330867)],
                  stops: [0.0, 1.0],
                  center: Alignment.center)),
          child: Center(
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 350,
              child: Column(
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: WtController,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      label: Text(
                        "Enter Your Weight (kg)",
                        style: TextStyle(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.line_weight,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                      controller: FeetController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        label: Text(
                          "Enter Your Height (feet)",
                          style: TextStyle(color: Colors.white),
                        ),
                        prefixIcon: Icon(
                          Icons.height,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: InchController,
                    decoration: const InputDecoration(
                      label: Text(
                        "Enter Your Height (inches)",
                        style: TextStyle(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.height,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const BeveledRectangleBorder(),
                      overlayColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                      var wt = WtController.text.toString();
                      var ft = FeetController.text.toString();
                      var inch = InchController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iinch = int.parse(inch);

                        var totalinch = (12 * ift) + iinch;
                        var totalcm = 2.54 * totalinch;
                        var tm = totalcm / 100;
                        var bmi = iwt / (tm * tm);
                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are OverWeight";
                          bgcolor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are UnderWeight";
                          bgcolor = Colors.red.shade300;
                        } else {
                          msg = "You are Healthy";
                          bgcolor = Colors.green.shade200;
                        }
                        result = " Your BMI is ${bmi.toStringAsFixed(2)}\n$msg";
                        setState(() {});
                      } else {
                        setState(() {
                          result = "Please fill all required Blanks!!";
                        });
                      }
                    },
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    // ignore: unnecessary_string_interpolations
                    "$result",
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
