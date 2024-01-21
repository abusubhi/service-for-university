import 'package:flutter/material.dart';
import 'package:uni/screens/gpa/avg.dart';
import 'package:uni/screens/gpa/gpa.dart';
import 'package:uni/screens/select_location.dart';
import 'package:uni/utils/navigations.dart';
import 'package:uni/widgets/cutom_button.dart';

class Student extends StatelessWidget {
  const Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomButton(
              text: "GPA", onPress: () => changeScreen(context, const GPA())),
          CustomButton(
              text: "Average", onPress: () => changeScreen(context, const AVG())),
          // CustomButton(
          //   text: "Bus Park Time",
          //   onPress: () => changeScreen(context, const BusTime()),
          // ),
          CustomButton(
              text: "Go To",
              onPress: () => changeScreen(context, const SelectLocation())),
          const Image(
            image: AssetImage("images/uni.jfif"),
          ),
        ],
      ),
    );
  }
}
