import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'custom_textfield.dart';

class GPA extends StatefulWidget {
  const GPA({super.key});

  @override
  State<GPA> createState() => _GPAState();
}

class _GPAState extends State<GPA> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController avg1Controller = TextEditingController(),
      time1Controller = TextEditingController(),
      avg2Controller = TextEditingController(),
      time2Controller = TextEditingController();

  double? avg1, time1, avg2, time2, result;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('GPA'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        child: CustomTextField(
                          hintText: 'Avg',
                          controller: avg1Controller,
                          onChange: (value) {
                            avg1 = double.parse(value);
                          },
                        ),
                      ),
                      const Text("x"),
                      SizedBox(
                        width: width * 0.45,
                        child: CustomTextField(
                          hintText: 'Hours',
                          controller: time1Controller,
                          onChange: (value) {
                            time1 = double.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        child: CustomTextField(
                          hintText: 'Avg',
                          controller: avg2Controller,
                          onChange: (value) {
                            avg2 = double.parse(value);
                          },
                        ),
                      ),
                      const Text("x"),
                      SizedBox(
                        width: width * 0.45,
                        child: CustomTextField(
                          hintText: 'Hours',
                          controller: time2Controller,
                          onChange: (value) {
                            time2 = double.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (result != null)
                  CustomText(
                    text: "GPA: $result",
                    weight: FontWeight.bold,
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (avg1 != null &&
                            time1 != null &&
                            avg2 != null &&
                            time2 != null) {
                          setState(() {
                            result = ((avg1! * time1!) + (avg2! * time2!)) /
                                (time1! + time2!);
                          });
                        } else {
                          // show snackbar
                        }
                      }
                    },
                    child: const Text(
                      "Calculate",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
