import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'custom_textfield.dart';

class AVG extends StatefulWidget {
  const AVG({super.key});

  @override
  State<AVG> createState() => _AVGState();
}

class _AVGState extends State<AVG> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController avg1Controller = TextEditingController(),
      time1Controller = TextEditingController(),
      avg2Controller = TextEditingController(),
      time2Controller = TextEditingController(),
      avg3Controller = TextEditingController(),
      time3Controller = TextEditingController();

  double? avg1, time1, avg2, time2, avg3, time3, result;
  double avgs = 0, times = 0;

  final List<Widget> _fields = [];
  final List<TextEditingController> _avgControllers = [];
  final List<TextEditingController> _timeControllers = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Average'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                _addButton(),
                // Subject1
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
                // Subject2
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
                // Subject3
                SizedBox(
                  height: width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        child: CustomTextField(
                          hintText: 'Avg',
                          controller: avg3Controller,
                          onChange: (value) {
                            avg3 = double.parse(value);
                          },
                        ),
                      ),
                      const Text("x"),
                      SizedBox(
                        width: width * 0.45,
                        child: CustomTextField(
                          hintText: 'Hours',
                          controller: time3Controller,
                          onChange: (value) {
                            time3 = double.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // // Subject4
                // SizedBox(
                //   height: width * 0.2,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Avg',
                //           controller: avg2Controller,
                //           onChange: (value) {
                //             avg2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //       const Text("x"),
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Hours',
                //           controller: time2Controller,
                //           onChange: (value) {
                //             time2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // // Subject5
                // SizedBox(
                //   height: width * 0.2,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Avg',
                //           controller: avg2Controller,
                //           onChange: (value) {
                //             avg2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //       const Text("x"),
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Hours',
                //           controller: time2Controller,
                //           onChange: (value) {
                //             time2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // // Subject6
                // SizedBox(
                //   height: width * 0.2,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Avg',
                //           controller: avg2Controller,
                //           onChange: (value) {
                //             avg2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //       const Text("x"),
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Hours',
                //           controller: time2Controller,
                //           onChange: (value) {
                //             time2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // // Subject7
                // SizedBox(
                //   height: width * 0.2,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Avg',
                //           controller: avg2Controller,
                //           onChange: (value) {
                //             avg2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //       const Text("x"),
                //       SizedBox(
                //         width: width * 0.45,
                //         child: CustomTextField(
                //           hintText: 'Hours',
                //           controller: time2Controller,
                //           onChange: (value) {
                //             time2 = double.parse(value);
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _fields.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                // decoration: ThemeHelper()
                                //     .inputBoxDecorationShaddow(),
                                child: _fields[index])),
                        _removeButton(index),
                      ],
                    );
                  },
                ),
                if (result != null)
                  CustomText(
                    text: "AVG: $result",
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
                          //   result =
                          avgs += ((avg1! * time1!) + (avg2! * time2!)) +
                              (avg3! * time3!);
                          times += (time1! + time2! + time3!);
                          for (var i = 0; i < _avgControllers.length; i++) {
                            avgs += (double.parse(_avgControllers[i].text) *
                                double.parse(_timeControllers[i].text));
                            times += double.parse(_timeControllers[i].text);
                          }
                          setState(() {
                            result = avgs / times;
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

  /// add button
  Widget _addButton() {
    return ElevatedButton(
      onPressed: () {
        if (_fields.length < 4) {
          // add new text-fields at the top of all friends textfields
          final timeController = TextEditingController(),
              avgController = TextEditingController();
          final field = SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomTextField(
                    hintText: 'Avg',
                    controller: avgController,
                    // onChange: (value) {
                    //   avg2 = double.parse(value);
                    // },
                  ),
                ),
                const Text("x"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomTextField(
                    hintText: 'Hours',
                    controller: timeController,
                    // onChange: (value) {
                    //   time2 = double.parse(value);
                    // },
                  ),
                ),
              ],
            ),
          );
          setState(() {
            _avgControllers.add(avgController);
            _timeControllers.add(timeController);
            _fields.add(field);
          });
        } else {
          // snack bar
        }
      },
      style: OutlinedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
            MediaQuery.of(context).size.height * 0.07),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: const CustomText(
        text: 'Add Subject',
        color: Colors.white,
      ),
    );
  }

  /// add / remove button
  Widget _removeButton(int index) {
    return InkWell(
      onTap: () {
        _fields.removeAt(index);
        _avgControllers.removeAt(index);
        _timeControllers.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
